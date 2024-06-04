import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/ui/cubits/home_cubit.dart';
import 'package:obilet_app/ui/cubits/login_cubit.dart';
import 'package:obilet_app/ui/cubits/my_profile_cubit.dart';
import 'package:obilet_app/ui/cubits/profile_cubit.dart';
import 'package:obilet_app/ui/cubits/registration_cubit.dart';
import 'package:obilet_app/ui/cubits/splash_cubit.dart';
import 'package:obilet_app/ui/cubits/trave_detail_cubit.dart';
import 'package:obilet_app/ui/cubits/travel_cubit.dart';

import 'package:obilet_app/ui/pages/sign_in.dart';
import 'package:obilet_app/ui/pages/splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TravelCubit(),),
        BlocProvider(create: (context) => RegistrationCubit(),),
        BlocProvider(create: (context) => LoginCubit(),),
        BlocProvider(create: (context) => ProfileCubit(),),
        BlocProvider(create: (context) => TravelDetailCubit(),),
        BlocProvider(create: (context) => SplashCubit(),),
        BlocProvider(create: (context) => MyProfileCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splash(),
      ),
    );
  }
}