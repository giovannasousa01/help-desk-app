import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';
import '../../widgets/lottie_animation_widget.dart';
import '../../widgets/text_form_field_pasword_widget.dart';
import '../../widgets/text_form_field_widget.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();

  bool _isVisible = true;

  void visiblePassword() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Logo animada...
            const LottieAnimation(
              pathAnimation: "assets/animations/animation_login.json",
              width: 400,
              height: 300,
            ),

            // Título...
            Text(
              "HelpDesk!",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: AppColors.textColorBlue,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // Subtítulo...
            Text(
              "O seu aplicativo de helpdesk",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: AppColors.textColorBlue,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: TextFormFieldWidget(
                controller: emailController,
                focusNode: emailFocus,
                textInputAction: TextInputAction.next,
                hintText: 'Email',
                preffixIcon: Icon(
                  Icons.alternate_email_rounded,
                  color: AppColors.textColorBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: TextFormFieldPasswordWidget(
                textInputAction: TextInputAction.done,
                obscureText: _isVisible,
                controller: senhaController,
                focusNode: senhaFocus,
                hintText: "Senha",
                suffixIcon: GestureDetector(
                  onTap: visiblePassword,
                  child: Icon(
                    _isVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: AppColors.textColorBlue,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Criar conta",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: AppColors.textColorBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_person_rounded,
                        color: AppColors.textColorBlue,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Recuperar senha",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: AppColors.textColorBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 50,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  "Acessar",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
