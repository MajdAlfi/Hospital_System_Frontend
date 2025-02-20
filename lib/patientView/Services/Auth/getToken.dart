import 'package:hospital_app_frontend/patientView/Services/others/dataProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future getToken(context) async {
  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString('userToken').toString();
  Provider.of<dataProvider>(context, listen: false).changeToken(token);
  return token;
}
