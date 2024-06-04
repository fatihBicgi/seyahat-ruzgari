

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/ui/cubits/profile_cubit.dart';
import 'package:obilet_app/ui/pages/my_profile_page.dart';
import 'package:obilet_app/ui/pages/sign_in.dart';

import '../cubits/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    context.read<ProfileCubit>().getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesabım",style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xffd23b38),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileCubit,ProfileState>(
        builder: (context, state) {
          print(state.toString());
          if(state is ProfileInitial){
            return Container();
          }else if(state is ProfileLoading){
            print(state);
            return Center(child: CircularProgressIndicator());
          }else if(state is ProfileCompleted){
            print(state);
            var person = state.response;
            return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Merhaba "),
                        Text("${person.name} ${person.surname}",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Card(
                        elevation: 2,
                        surfaceTintColor: Colors.white,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        child:  Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              ContainerItem("Seyehatlerim", Icon(Icons.travel_explore_rounded),() {

                              }),
                              Divider(),
                              ContainerItem("Kampanyalarım", Icon(Icons.campaign),() {

                              }),
                              Divider(),
                              ContainerItem("Profilim", Icon(Icons.person),() {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyProfilePage(profileModel: person),));
                              }),
                              Divider(),

                              ContainerItem("Yardım", Icon(Icons.help_outline),() {

                              }),
                              Divider(),
                              ContainerItem("Ayarlar", Icon(Icons.settings),() {

                              }),
                              Divider(),
                              ContainerItem("Hakkımızda", Icon(Icons.info_outline),() {

                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 2,
                        surfaceTintColor: Colors.white,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0,left: 12.0),
                          child: ContainerItem("Çıkış Yap", Icon(Icons.exit_to_app),() {
                            context.read<ProfileCubit>().signOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
                          }),
                        ),
                      ),
                    ),
                  ],
                );
          }else{
            return Container();
          }
        },
      ),
    );
  }
}

class ContainerItem extends StatelessWidget {
  String title;
  Icon icon;
  VoidCallback? fun;
  ContainerItem(this.title, this.icon,this.fun, {super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: fun,
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0,left: 4.0,bottom: 8.0,top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(

              children: [
                icon,
                SizedBox(width: 10,),
                Text(title),
              ],
            ),
            Icon(Icons.arrow_forward_ios,size:15,weight: 0.5),
          ],
        ),
      ),
    );
  }
}

