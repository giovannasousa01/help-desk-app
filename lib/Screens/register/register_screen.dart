// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_desk_app/utils/app_colors.dart';
import 'package:lottie/lottie.dart';

import '../../model/users.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  String msgError = "";

  void validarCampos() {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length >= 8) {
          Users user = Users();
          user.nome = nome;
          user.email = email;
          user.senha = senha;

          cadastrarUsuario(user);
        } else {
          msgError = "Informe uma senha igual ou maior que 8 caracteres";
        }
      } else {
        msgError = "Preencha o campo Email corretamente";
      }
    } else {
      msgError = "Preencha o campo Nome corretamente";
    }
  }

  void cadastrarUsuario(Users user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(
      email: user.email,
      password: user.senha,
    )
        .then((firebaseUser) {
      const SnackBar snackBar = SnackBar(
        content: Text("Usuário cadastrado com sucesso"),
        duration: Duration(seconds: 5),
      );

      msgError = "";
      nomeController.text = "";
      emailController.text = "";
      senhaController.text = "";

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((error) {
      print("Aconteceu um erro: ${error.toString()}");
    });
  }

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
            lottieAnimation(),
            Text(
              "Cadastre-se",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: AppColors.textColorBlue,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              "Crie a sua conta agora mesmo",
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
              child: TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  hintText: "Nome",
                  filled: true,
                  fillColor: AppColors.primaryOpacityColor,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColors.textColorBlue,
                      fontSize: 18,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.textColorBlue,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.buttonRed,
                    ),
                  ),
                  errorStyle: GoogleFonts.poppins(
                    color: AppColors.textColorRed,
                    fontSize: 12,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: AppColors.textColorBlue,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 10,
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  filled: true,
                  fillColor: AppColors.primaryOpacityColor,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColors.textColorBlue,
                      fontSize: 18,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: AppColors.textColorBlue,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.buttonRed,
                    ),
                  ),
                  errorStyle: GoogleFonts.poppins(
                    color: AppColors.textColorRed,
                    fontSize: 12,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: AppColors.textColorBlue,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                bottom: 30,
              ),
              child: TextFormField(
                controller: senhaController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Senha",
                  filled: true,
                  fillColor: AppColors.primaryOpacityColor,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColors.textColorBlue,
                      fontSize: 18,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(15),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.textColorBlue,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: visiblePassword,
                    child: Icon(
                      _isVisible
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.buttonRed,
                    ),
                  ),
                  errorStyle: GoogleFonts.poppins(
                    color: AppColors.textColorRed,
                    fontSize: 12,
                  ),
                ),
                style: GoogleFonts.poppins(
                  color: AppColors.textColorBlue,
                  fontSize: 18,
                ),
                obscureText: _isVisible,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  validarCampos();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: Text(
                  "Cadastrar",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonRed,
                ),
                child: Text(
                  "Voltar",
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

Widget lottieAnimation() {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(top: 10, bottom: 10),
    child: Lottie.asset(
      'assets/animations/animation_users.json',
      width: 250,
      height: 250,
      fit: BoxFit.fill,
    ),
  );
}
