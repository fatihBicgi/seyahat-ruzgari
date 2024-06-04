

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/ui/add_travel.dart';
import 'package:obilet_admin/ui/travel_info.dart';

import 'cubits/home_cubit.dart';
import 'cubits/home_state.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().getTravels();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Seferler"),backgroundColor: Color(0xffd23b38)),
      floatingActionButton: IconButton(
        style: IconButton.styleFrom(backgroundColor: Color(0xffd23b38),minimumSize: Size(60,60)),
          onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTravel(),));
      }, icon: Icon(Icons.add,color: Colors.white,)),
      body: Scaffold(
        body: BlocBuilder<HomeCubit,HomeState>(
          builder: (context, state) {
            if(state is HomeInitial){
              return Text("HELLO");
            }else if(state is HomeLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is HomeCompleted){
              var travels = state.response;
              return ListView.builder(
                itemCount: travels.length,
                itemBuilder: (context, index) {
                  var travel = travels[index];
                  print(travel.companyName);
                  return Card(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0,left: 8.0,top: 8.0,bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(travel.companyImage,height: 35),
                            Text("${travel.departureTime}  ",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text("${travel.price} TL",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Row(children: [const Icon(Icons.chair_outlined,size: 15),const SizedBox(width: 5),Text(travel.busType,style: const TextStyle(fontSize: 13),)]),
                            Row(children: [const Icon(Icons.access_time,size: 15,color: Colors.red,),const SizedBox(width: 3),Text(travel.arrivalTime,style: const TextStyle(fontSize: 15,color: Colors.red),)],),
                            IconButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TravelInfo(travel),));
                            }, icon: Icon(Icons.edit,color: Color(0xffd23b38),size: 20,)),
                            IconButton(onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Seferi silmek istediğinizden emin misiniz?"),
                                    action: SnackBarAction(label: "Evet", onPressed: () {
                                      context.read<HomeCubit>().deleteTravel(travel.docId);
                                    },),));
                            }, icon: Icon(Icons.delete,color: Color(0xffd23b38),size: 20,))
                          ],
                        ),
                      ),
                    ),
                  );

              },);
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}
