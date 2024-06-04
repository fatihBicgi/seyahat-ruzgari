import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/ui/cubits/registration_cubit.dart';
import 'package:obilet_app/ui/pages/sign_in.dart';
import 'package:obilet_app/ui/pages/bottom_nav.dart';
import '../../data/entity/registration_state.dart';
import '../widgets/text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var kvkkCheckbox = false;
  var campaignCheckbox = false;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffd23b38),
        title: Text("Üye Ol", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        ),
      ),
      body: BlocListener<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationCompleted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavBar()),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 80),
                Container(
                  width: double.infinity,
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
                          focusNode: FocusNode(),
                        ),
                        BasicTextForm(
                          hintText: "Doldurulması zorunludur.",
                          labelText: "Şifre",
                          obscureText: true,
                          controller: passwordController,
                          focusNode: FocusNode(),
                        ),
                        BasicTextForm(
                          hintText: "Doldurulması zorunludur.",
                          labelText: "Tekrar şifre",
                          obscureText: true,
                          controller: passwordAgainController,
                          focusNode: FocusNode(),
                        ),
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Checkbox(
                              value: kvkkCheckbox,
                              onChanged: (value) {
                                setState(() {
                                  kvkkCheckbox = !kvkkCheckbox;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                "Kişisel verilerin işlenmesine ilişkin Aydınlatma Metni'ni okudum.",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: campaignCheckbox,
                              onChanged: (value) {
                                setState(() {
                                  campaignCheckbox = !campaignCheckbox;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                "Kampanya ve duyuruları ticari elektronik ileti olarak almayı ve kişisel verilerimin pazarlama amacıyla işlenmesini onaylıyorum.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 200,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: campaignCheckbox && kvkkCheckbox
                                  ? Color(0xff1f9b78)
                                  : Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.circular(2),
                              ),
                            ),
                            onPressed: campaignCheckbox && kvkkCheckbox
                                ? () {
                              context
                                  .read<RegistrationCubit>()
                                  .registration(
                                  mailController.text,
                                  passwordController.text,
                                  passwordAgainController.text);
                            }
                                : null,
                            child: const Text(
                              "Üye ol",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
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
