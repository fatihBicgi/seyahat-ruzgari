import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubits/splash_cubit.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    context.read<SplashCubit>().checkUserStatus(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd23b38),
      body: Column(
        children: [
          SizedBox(height: 180,),
          Center(child: Image.asset("assets/images/obilet_logo.png",width: 150)),
        ],
      ),
    );
  }
}
