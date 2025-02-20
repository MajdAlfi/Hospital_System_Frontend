import 'package:flutter/material.dart';
import 'package:hospital_app_frontend/patientView/Services/Auth/register.dart';
import 'package:hospital_app_frontend/patientView/Services/others/screenSize.dart';

class registerPage extends StatelessWidget {
  registerPage({super.key});
  final Email = TextEditingController();
  final address = TextEditingController();
  final name = TextEditingController();
  final phoneNum = TextEditingController();
  final Pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: widthScr(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightScr(context) * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                ),
                Image.asset(
                  'assets/images/signup.jpeg',
                  height: heightScr(context) * 0.15,
                  width: widthScr(context) * 0.5,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: heightScr(context) * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'SignUp',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: (heightScr(context) > 710) ? 55 : 40,
                          color: const Color.fromARGB(255, 79, 69, 68),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.9,
                    child: TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 79, 69, 68),
                      ),
                      controller: name,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: 'Name',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.9,
                    child: TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 79, 69, 68),
                      ),
                      controller: address,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: 'Address',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.9,
                    child: TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 79, 69, 68),
                      ),
                      controller: phoneNum,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.9,
                    child: TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 79, 69, 68),
                      ),
                      controller: Email,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightScr(context) * 0.06,
                    width: widthScr(context) * 0.9,
                    child: TextField(
                      style: const TextStyle(
                        color: Color.fromARGB(255, 79, 69, 68),
                      ),
                      controller: Pass,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: (heightScr(context) > 710) ? 20 : 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 79, 69, 68)),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.transparent),
                    height: (heightScr(context) > 710)
                        ? heightScr(context) * 0.06
                        : heightScr(context) * 0.07,
                    width: widthScr(context) * 0.9,
                    child: TextButton(
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              color: Color.fromARGB(255, 79, 69, 68),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () async {
                          await register(Email.text, Pass.text, name.text,
                              int.parse(phoneNum.text), address.text, context);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
