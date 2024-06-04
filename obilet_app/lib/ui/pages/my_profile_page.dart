
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/entity/profile_model.dart';
import 'package:obilet_app/ui/cubits/my_profile_cubit.dart';
import 'package:obilet_app/ui/cubits/profile_cubit.dart';
import 'package:obilet_app/ui/pages/bottom_nav.dart';
import 'package:obilet_app/ui/pages/sign_in.dart';
import 'package:obilet_app/ui/widgets/text_field.dart';

class MyProfilePage extends StatefulWidget {
  ProfileModel profileModel;
   MyProfilePage({required this.profileModel,Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController identityController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var person = widget.profileModel;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffd23b38),
        title: Text("Kullanıcı Bilgilerim",style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 64.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.black26)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      BasicTextForm(hintText: person.name, labelText: "AD", obscureText: false,controller: nameController,focusNode: FocusNode()),
                      BasicTextForm(hintText: person.surname, labelText: "SOYAD", obscureText: false,controller: surnameController,focusNode: FocusNode()),
                      BasicTextForm(hintText: person.identityId, labelText: "T.C. KİMLİK NO", obscureText: false,controller: identityController,focusNode: FocusNode()),
                      BasicTextForm(hintText: person.date, labelText: "DOĞUM TARİHİ", obscureText: false,controller: dateController,focusNode: FocusNode()),
                      BasicTextForm(hintText: person.phone, labelText: "CEP TELEFONU", obscureText: false,controller: phoneController,focusNode: FocusNode()),
                      BasicTextForm(hintText: person.mail, labelText: "E-MAİL", obscureText: false,controller: mailController,focusNode: FocusNode()),
                      SizedBox(height: 30,),
                      TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(200, 30),
                            backgroundColor: Color(0xff1f9b78),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                          ),
                          onPressed: () {
                            context.read<MyProfileCubit>().updateUserInfo(nameController.text, surnameController.text, dateController.text, phoneController.text,identityController.text);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar(),));
                      }, child: Text("Bilgilerimi Güncelle",style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
                onTap: () {
                  context.read<MyProfileCubit>().makeStatusFreeze();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
                },
                child: Text("Hesabı dondurmak için tıklayın",style: TextStyle(color: Colors.black38,fontSize: 15),)),
          ],
        ),
      ),
    );
  }
}
