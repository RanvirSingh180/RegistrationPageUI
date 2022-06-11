import 'package:flutter/material.dart';
import 'main.dart';
import 'register_text_form_field.dart';

TextEditingController cPassword = TextEditingController();
TextEditingController cCPassword = TextEditingController();
TextEditingController cName = TextEditingController();
TextEditingController cUsername = TextEditingController();
TextEditingController cMobile = TextEditingController();


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        backgroundColor: Colors.blue,
      ),
      body: const RegisterBody(),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo_bg.png"))),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 100,
                    width: 100),
                const SizedBox(
                  height: 20,
                ),
                const Text("Welcome to PSD Gang",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("FACEBOOK"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.indigo,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 13,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("GOOGLE+"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            textStyle: const TextStyle(
                              fontSize: 13,
                            )),
                      ),
                    )
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 30.0, right: 5.0),
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 50,
                        )),
                  ),
                  const Text("OR",
                      style: TextStyle(color: Colors.grey, fontSize: 17)),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 30.0),
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 50,
                        )),
                  ),
                ]),
                Form(
                    key: formKey,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 30.0, left: 30, top: 10),
                      child: Column(
                        children: [
                          RegisterTextFormField(
                              controller: cName,
                              label: "Full Name",
                              validator: (String? text) {
                                if (text?.trim().isEmpty ?? true) {
                                  return 'Full Name should not be empty';
                                } else
                                // ignore: avoid_print
                                {
                                  cName.text = text!;
                                  return null;
                                }
                              }),
                          const SizedBox(height: 5),
                          RegisterTextFormField(
                              controller: cMobile,
                              label: "Mobile No.",
                              keyboardInputType: TextInputType.number,
                              validator: (text) {
                                if ((text?.isEmpty ?? true)) {
                                  return 'Mobile No. should not be empty';
                                } else if (((text!.length < 10))) {
                                  return 'Please Enter A 10 Digit Number';
                                } else if (text.contains(" ")) {
                                  return "Spaces not allowed";
                                } else {
                                  cMobile.text = text;
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          RegisterTextFormField(
                              controller: cUsername,
                              label: "Username",
                              validator: (text) {
                                if (text?.isEmpty ?? true) {
                                  return 'Username should not a empty';
                                } else if (text!.contains(" ")) {
                                  text.replaceAll(" ", "");
                                  return "No spaces  ";
                                } else {
                                  cUsername.text = text;
                                  return null;
                                }
                              }),
                          const SizedBox(height: 5),
                          RegisterTextFormField(
                              hiddenText: true,
                              label: "Password",
                              controller: cPassword,
                              validator: (text) {
                                cPassword.text = text!;
                                if (text.isEmpty == true) {
                                  return 'Password should not a empty';
                                } else if (((text.length < 8))) {
                                  return 'At least 8 Character Required';
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 5,
                          ),
                          RegisterTextFormField(
                              hiddenText: true,
                              label: "Confirm Password",
                              controller: cCPassword,
                              validator: (text) {
                                cCPassword.text = text!;
                                if (text.isEmpty == true) {
                                  return 'Password should not a empty';
                                }
                                if (cCPassword.text != cPassword.text) {
                                  return 'Password Do not Match';
                                } else {
                                  return null;
                                }
                              }),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 320,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFF61F2F5), Color(0xFF11468F)]),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: ElevatedButton(
                    onPressed: validateController,
                    child: const Text("Register Now!"),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white70)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/// 4. validate function
void validateController() {
  if (!formKey.currentState!.validate()) {
    // value is false.. textFields are rebuilt in order to show errorLabels
    return;
  } else {
    // ignore: avoid_print
    print("Name- " + cName.text);
    // ignore: avoid_print
    print("Mobile- " + cMobile.text);
    // ignore: avoid_print
    print("Username- " + cUsername.text);
    // ignore: avoid_print
    print("Password- " + cPassword.text);
  }
}
