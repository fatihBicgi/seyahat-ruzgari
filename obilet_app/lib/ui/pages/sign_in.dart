import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:obilet_app/ui/cubits/login_cubit.dart';
import 'package:obilet_app/ui/pages/sign_up.dart';

import '../cubits/login_state.dart';
import '../widgets/text_field.dart';
import 'bottom_nav.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffd23b38),
        title: Text(
          "Üye Girişi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocListener<LoginCubit,LoginState>(
        listener: (context, state) {
          if(state is LoginCompleted){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
          }
          if(state is LoginError){
            showErrorDialog("Hesabınız aktif değil. Aktifleştirmek için bizimle iletişime geçin!");
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        BasicTextForm(
                          hintText: "E-mail adresinizi giriniz.",
                          labelText: "E-mail",
                          obscureText: false,
                          controller: mailController,
                          focusNode: _emailFocusNode,
                        ),
                        BasicTextForm(
                          hintText: "Doldurulması zorunludur.",
                          labelText: "Şifre",
                          obscureText: true,
                          controller: passwordController,
                          focusNode: _passwordFocusNode,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Şifremi Unuttum",
                                style: TextStyle(color: Color(0xffd23b38)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 200,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff1f9b78),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onPressed: () {
                              context.read<LoginCubit>().login(mailController.text, passwordController.text);
                            },
                            child: Text(
                              "Giriş yap",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Üye değil misiniz?",
                        style: TextStyle(color: Colors.black26),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        },
                        child: Text(
                          "HEMEN ÜYE OL",
                          style: TextStyle(color: Color(0xff1f9b78)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
