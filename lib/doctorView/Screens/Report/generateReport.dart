import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_app_frontend/doctorView/Services/ReportServices/uploadReport.dart';
import 'package:hospital_app_frontend/patientView/Services/others/baseUrlIMG.dart';
import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

Future<Uint8List> generateReport(BuildContext context, data) async {
  final pdf = pw.Document();
  final ByteData bytes = await rootBundle.load('assets/images/hospital.png');
  final Uint8List byteList = bytes.buffer.asUint8List();
  final document = pw.Document();
// Fetch network image as bytes
  final imageUrl = '${baseUrlIMG()}${data[3]}';
  final response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode != 200) {
    throw Exception('Failed to load image');
  }

  // Create a MemoryImage for the PDF
  final networkImage = pw.MemoryImage(response.bodyBytes);

  document.addPage(pdfPage(byteList, data, context, networkImage));

  return document.save();
}

pdfPage(Uint8List byteList, data, BuildContext context, networkimg) {
  DateTime dateReport = DateTime.parse('${data[0]['Date']}');
  return pw.Page(
    build: (pw.Context context1) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // pw.Align(
          //   alignment: pw.Alignment.center,
          //   child:
          // ),
          pw.SizedBox(
            height: 0.8 * PdfPageFormat.cm,
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Image(pw.MemoryImage(byteList),
                    fit: pw.BoxFit.fitHeight, height: 50, width: 50),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Hospital Name',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 14),
                      ),
                      pw.Text('Hospital Address',
                          style: const pw.TextStyle(fontSize: 14)),
                    ]),
              ]),
          pw.SizedBox(
            height: 0.2 * PdfPageFormat.cm,
          ),
          pw.SizedBox(
            width: 18 * PdfPageFormat.cm,
            child: pw.Divider(
              thickness: 5,
              color: PdfColors.black,
            ),
          ),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      '${data[1]['Name']}',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 14),
                    ),
                    pw.Text('${data[1]['Address1']}',
                        style: const pw.TextStyle(fontSize: 12)),
                    pw.Text('${data[1]['phoneNum']}',
                        style: const pw.TextStyle(fontSize: 12)),
                    // pw.Container(
                    //     width: 50.0,
                    //     height: 50.0,
                    //     child: pw.Image(pw.MemoryImage(imageData))),
                  ],
                ),
                pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 45),
                    child: pw.SizedBox(
                        child: pw.BarcodeWidget(
                          data:
                              '${baseUrlIMG()}reports/report_${data[0]['_id']}.pdf',
                          barcode: pw.Barcode.qrCode(),
                        ),
                        height: 50,
                        width: 50))
              ]),
          pw.SizedBox(
            height: PdfPageFormat.cm,
          ),
          pw.Text(
            'Report',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20),
          ),
          pw.Container(
              color: PdfColors.white,
              padding: const pw.EdgeInsets.all(20.0),
              child: pw.Column(children: [
                pw.Center(
                  child: pw.Text(
                    '${data[0]['classification']}',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 15),
                  ),
                ),
                pw.SizedBox(
                  height: 15,
                ),
                pw.Align(
                    alignment: pw.Alignment.topLeft,
                    child: pw.Text(
                      '${data[0]['disease']}',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 12),
                    )),
                pw.SizedBox(
                    width: 15 * PdfPageFormat.cm,
                    height: 5 * PdfPageFormat.cm,
                    child: pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          '${data[0]['diagnosis']}',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal, fontSize: 12),
                        ))),
                pw.SizedBox(
                    width: 15 * PdfPageFormat.cm,
                    child: pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          '${data[0]['Conditions']}',
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.normal, fontSize: 12),
                        ))),
                pw.SizedBox(height: PdfPageFormat.cm),
                pw.Center(
                    //  width: 15 * PdfPageFormat.cm,
                    child: pw.Image(networkimg,
                        height: 5 * PdfPageFormat.cm,
                        width: 5 * PdfPageFormat.cm,
                        fit: pw.BoxFit.cover)),
              ])),
          pw.Center(
              child: pw.SizedBox(
                  width: 15 * PdfPageFormat.cm,
                  child: pw.Divider(thickness: 2, color: PdfColors.black))),
          pw.SizedBox(
            height: 0.4 * PdfPageFormat.cm,
          ),
          pw.Padding(
              padding: const pw.EdgeInsets.only(right: 15),
              child: pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'DR. ${data[2]['Name']}',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 12),
                    ),
                    pw.Text(
                      '${dateReport.year}-${dateReport.month}-${dateReport.day}',
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.normal, fontSize: 12),
                    ),
                    pw.Text(
                        (data[0]['doctorConfirmation'] == false)
                            ? 'Not Signed'
                            : 'Signed',
                        style: const pw.TextStyle(color: PdfColors.grey)),
                    pw.SizedBox(
                        width: 3 * PdfPageFormat.cm,
                        child:
                            pw.Divider(thickness: 1, color: PdfColors.black)),
                  ],
                ),
              )),
        ],
      );
    },
  );
}

Future<void> savePDF(String fileName, Uint8List byteList, BuildContext context,
    String patientID, String diagnosisID) async {
  final output = await getTemporaryDirectory();
  var filepath = "${output.path}/$fileName.pdf";
  final file = File(filepath);
  await file.writeAsBytes(byteList);
  final base64 = base64Encode(file.readAsBytesSync());
  uploadReport(context, base64, '$fileName', patientID, diagnosisID)
      .then(((value) async {
    await file.delete();
    final url = Uri.parse('${baseUrlIMG()}reports/$fileName');
    launchUrl(url);
  }));
}
