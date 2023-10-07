import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:keybox/home/Home.dart';
import 'package:keybox/main.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 120,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const SizedBox(height: 40),
              Text(
                'Bienvenue!',
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
                          hintText: "exemple@domain.com",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
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
                          hintText: "min 8 caractères",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
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
                            Navigator.pushReplacementNamed(context, '/');
                          } else {
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                        child: Text(
                          "Se connecter",
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
                                text: "Vous n'avez pas de compte ? ",
                                style: GoogleFonts.magra(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.5))),
                            TextSpan(
                                text: "S'inscrire",
                                style: GoogleFonts.magra(
                                    fontSize: 16, color: blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/signup');
                                  })
                          ],
                        )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: Text("Mot de passe oublié ?",
                              style: GoogleFonts.magra(
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.5)))),
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
