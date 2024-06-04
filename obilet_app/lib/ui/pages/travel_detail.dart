
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/data/entity/seat_model.dart';
import 'package:obilet_app/ui/cubits/trave_detail_cubit.dart';
import 'package:obilet_app/ui/cubits/travel_detail_state.dart';
import 'package:obilet_app/ui/pages/payment.dart';

import '../../data/entity/travel_model.dart';

class TravelDetail extends StatefulWidget {
  TravelModel travel;

  TravelDetail(this.travel);

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  List<SeatModel> selectedSeats = [];

  @override
  void initState() {
    context.read<TravelDetailCubit>().getSeats(widget.travel.docId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koltuk Seçimi",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffd23b38),
      ),
      body:   Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ArmchairInfo("Dolu - Erkek",Colors.blue),
                ArmchairInfo("Dolu - Kadın", Colors.pink),
                const Row(
                  children: [
                    Icon(Icons.crop_square_outlined,size: 15,),
                    Text("Boş Koltuk",style: TextStyle(fontSize: 14),),
                  ],
                )
              ],
            ),
          ),
          BlocBuilder<TravelDetailCubit,TravelDetailState>(
            builder: (context,state) {
              if(state is TravelDetailInitial){
                return Text("hello");
              }else if(state is TravelDetailLoading){
                return Center(child: CircularProgressIndicator(),);
              }else if(state is TravelDetailCompleted){
                var seats = state.response;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 160,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: seats.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          var seat = seats[index];
                          var a = context.read<TravelDetailCubit>().isSeatSelected(seat, selectedSeats);
                          switch(seat.status){
                            case "available" :  if(index % 3 == 1){
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,bottom: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                     if(a){
                                       context.read<TravelDetailCubit>().seatRemove(seat, selectedSeats,widget.travel.price);
                                     }else{
                                       context.read<TravelDetailCubit>().seatAdd(seat, selectedSeats,widget.travel.price);
                                     }
                                      print(selectedSeats.toString());
                                    });
                                  },
                                  child: Container(

                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: a ? Colors.green : Colors.white,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                              );
                            }
                            else{
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,top: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(a){
                                        context.read<TravelDetailCubit>().seatRemove(seat, selectedSeats,widget.travel.price);
                                      }else{
                                        context.read<TravelDetailCubit>().seatAdd(seat, selectedSeats,widget.travel.price);
                                      }
                                      print(selectedSeats.toString());
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: a ? Colors.green : Colors.white,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                              );
                            }
                            case "male" :  if(index % 3 == 1){
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,bottom: 16.0),
                                child: Container(

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),
                                  child: Text((index + 1).toString()),
                                ),
                              );
                            }
                            else{
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,top: 16.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),

                                  child: Text((index + 1).toString()),
                                ),
                              );
                            }
                            case "female":  if(index % 3 == 1){
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,bottom: 16.0),
                                child: Container(

                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),
                                  child: Text((index + 1).toString()),
                                ),
                              );
                            }
                            else{
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0,top: 16.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black)),

                                  child: Text((index + 1).toString()),
                                ),
                              );
                            }
                          }

                        },)
                  ),
                );
              }else{
                return Container();
              }
            }
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: selectedSeats.length,
                    itemBuilder: (context, index) {
                      var _selectedSeat = selectedSeats[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Koltuk no : ${_selectedSeat.seatNumber}"),
                          Text("${widget.travel.price}"),
                        ],
                      );
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Toplam:"),
                      Text("${context.watch<TravelDetailCubit>().totalPrice} TL"),
                    ],
                  ),
                ),
                TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    backgroundColor: Color(0xffd23b38)) ,

                onPressed:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(seats: selectedSeats, travel: widget.travel),));

                } , child: Text("Ödeme Yap",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArmchairInfo extends StatelessWidget {
  String text;
  Color color;
  ArmchairInfo(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.square_rounded,color: color,size: 15,),
        Text(text,style: const TextStyle(fontSize: 14),),
      ],
    );
  }
}
