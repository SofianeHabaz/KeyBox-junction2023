import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../constants.dart';
import 'package:intl/intl.dart';
import 'package:keybox/states.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  bool age = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(Icons.arrow_back, size: 32),
                      onTap: () => Navigator.pop(context),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    SizedBox(
                      width: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'Inscription',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Nom et Prénom',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Obligatoire"),
                        ]),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Date de naissance',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: dateinput,
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            locale: const Locale("fr", "FR"),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            setState(() {
                              dateinput.text = formattedDate;
                              age =
                                  (DateTime.now().year - pickedDate.year) < 15;
                              print('age ${age}');
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Obligatoire"),
                        ]),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      age
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                'Nom et Prénom du parent',
                                style: GoogleFonts.poppins(fontSize: 14),
                              ),
                            )
                          : SizedBox(),
                      age
                          ? SizedBox(
                              height: 8,
                            )
                          : SizedBox(),
                      age
                          ? TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "* Obligatoire"),
                              ]),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Color(0xffefefef),
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: blue,
                                    width: 1.0,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    )),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                              ),
                            )
                          : SizedBox(),
                      age ? const SizedBox(height: 30) : SizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Wilaya',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InputDecorator(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration.collapsed(hintText: ''),
                            items: algeria_cites
                                .map<DropdownMenuItem<String>>((Map wilaya) {
                              return DropdownMenuItem(
                                child: Text(
                                    '(${wilaya['code']}) ${wilaya['name']}'),
                                value: '(${wilaya['code']}) ${wilaya['name']}',
                              );
                            }).toList(),
                            onChanged: (e) {},
                            elevation: 0,
                            menuMaxHeight:
                                MediaQuery.of(context).size.height * 0.3,
                            itemHeight: 64,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Numero de téléphone',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      IntlPhoneField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                        initialCountryCode: 'DZ',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Adresse email',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Obligatoire"),
                          EmailValidator(errorText: "Entrez un email valide"),
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Mot de passe',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Obligatoire"),
                          MinLengthValidator(6, errorText: "min 6 characters"),
                          MaxLengthValidator(15, errorText: "max 15 characters")
                        ]),
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() => isHidden = !isHidden);
                            },
                            icon: isHidden
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Confirmer le mot de passe',
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Obligatoire"),
                          MinLengthValidator(6, errorText: "min 6 characters"),
                          MaxLengthValidator(15, errorText: "max 15 characters")
                        ]),
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffefefef),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: blue,
                              width: 1.0,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() => isHidden = !isHidden);
                            },
                            icon: isHidden
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.popUntil(context,
                                (route) => route.settings.name == "/login");
                          } else {
                            print("Not Validated");
                          }
                        },
                        child: Text(
                          "S\'incrire",
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: blue, // Background Color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16)),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Vous avez un compte ? ",
                                style: GoogleFonts.magra(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.5))),
                            TextSpan(
                                text: "Se connecter",
                                style: GoogleFonts.magra(
                                    fontSize: 16, color: blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.popUntil(
                                        context,
                                        (route) =>
                                            route.settings.name == "/login");
                                  })
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
