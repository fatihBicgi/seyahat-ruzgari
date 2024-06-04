import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_app/ui/cubits/trave_state.dart';
import 'package:obilet_app/ui/cubits/travel_cubit.dart';
import 'package:obilet_app/ui/pages/travel_detail.dart';

class TravelPage extends StatefulWidget {
  String from;
  String to;
  String date;

  TravelPage(this.from, this.to,this.date);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  bool sortByDesc = true;
  bool sortByDescDate = true;

  void sortPrices() {
    if (sortByDesc) {
      context.read<TravelCubit>().sortByDescPrice(widget.from, widget.to);
    } else {
      context.read<TravelCubit>().sortByAscPrice(widget.from, widget.to);
    }
    setState(() {
      sortByDesc = !sortByDesc;
    });
  }
  void sortDate(){
    if(sortByDescDate){
      context.read<TravelCubit>().sortByDescDate(widget.from, widget.to);
    }else{
      context.read<TravelCubit>().sortByAscDate(widget.from, widget.to);
    }
    setState(() {
      sortByDescDate = !sortByDescDate;
    });
  }

  @override
  void initState() {
    context.read<TravelCubit>().getTravels(widget.from, widget.to,widget.date);
    super.initState();
    print(widget.date);
  }
  @override
  Widget build(BuildContext context) {
    var chairCount = 30;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffd23b38),
        title: Text("${widget.from} -> ${widget.to}",style: const TextStyle(fontSize: 16,color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
      children: [
        Row(

          children: [
            const Padding(padding: EdgeInsets.only(left: 5)),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFD23B38),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
              ),
                onPressed: sortDate, child: Row(
                  children: [
                    const Text("Saate göre sırala",style: TextStyle(color: Colors.white,fontSize: 12),),
                    sortByDescDate? const Icon(Icons.arrow_drop_up,color: Colors.white,size: 15,) : const Icon(Icons.arrow_drop_down,color: Colors.white,size: 15,),
                  ],
                )),
            const SizedBox(width: 5),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFD23B38),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
                onPressed: () {
                  setState(() {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => DraggableScrollableSheet(
                        expand: false,
                        builder: (context,
                          scrollController) => SingleChildScrollView(
                          controller: ScrollController(),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 32.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center     ,
                                children: [
                                  TextButton(
                                  style: TextButton.styleFrom(minimumSize: Size(350, 30),backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                  onPressed: () {
                                    context.read<TravelCubit>().getTravelsByCompany("Pamukkale");
                                    Navigator.of(context).pop();
                                  }, child: Text("Pamukkale",style: TextStyle(color: Colors.white),)),
                                  TextButton(
                                    style: TextButton.styleFrom(minimumSize: Size(350, 30),backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                      onPressed: () {
                                      context.read<TravelCubit>().getTravelsByCompany("Ali Osman Ulusoy");
                                      Navigator.of(context).pop();

                                  }, child: Text("Ali Osman Ulusoy",style: TextStyle(color: Colors.white),)),
                                  TextButton(
                                   style: TextButton.styleFrom(minimumSize: Size(350, 30),backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                    onPressed: () {
                                      context.read<TravelCubit>().getTravelsByCompany("Kamil Koç");
                                      Navigator.of(context).pop();
                                  }, child: Text("Kamil Koç",style: TextStyle(color: Colors.white),)),
                                  TextButton(
                                   style: TextButton.styleFrom(minimumSize: Size(350, 30),backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                    onPressed: () {
                                     context.read<TravelCubit>().getTravelsByCompany("Isparta Petrol Turizm");
                                     Navigator.of(context).pop();
                                  }, child: Text("Isparta Petrol Turizm",style: TextStyle(color: Colors.white),)),
                                  TextButton(
                                   style: TextButton.styleFrom(minimumSize: Size(350, 30),backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                                    onPressed: () {
                                     context.read<TravelCubit>().getTravels(widget.from, widget.to,widget.date);
                                     Navigator.of(context).pop();
                                  }, child: Text("Temizle",style: TextStyle(color: Colors.white),))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });

                }, child: const Text("Filtrele",style: TextStyle(color: Colors.white,fontSize: 12),)),
            const SizedBox(width: 5),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFD23B38),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
                onPressed: sortPrices, child: Row(
                  children: [
                    const Text("Fiyata göre sırala",style: TextStyle(color: Colors.white,fontSize: 12),),
                    sortByDesc ? const Icon(Icons.arrow_drop_up,color: Colors.white,size: 15,) : const Icon(Icons.arrow_drop_down,color: Colors.white,size: 15,),

                  ],
                )),

          ],
        ),
       BlocBuilder<TravelCubit,TravelState>(builder: (context, state) {
         if(state is TravelInitial){
           return const Center(child: Text("Hello"));
         }else if(state is TravelLoading){
           return const Center(child: CircularProgressIndicator());
         }else if(state is TravelCompleted){

           var travels = state.response;
           return  SizedBox(
             height: 500,
             child: ListView.builder(
               itemCount: travels.length,
               itemBuilder: (context,index) {
                 var travel = travels[index];
                 return InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => TravelDetail(travel),));
                   },
                   child: Card(
                     child: Container(
                       child: Padding(
                         padding: const EdgeInsets.only(right: 16.0,left: 8.0,top: 8.0,bottom: 8.0),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Image.network(travel.companyImage,height: 35),
                                  Text("${travel.departureTime}  ",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Text("${travel.price} TL",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                               ],),
                              Padding(
                               padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 8.0,bottom: 16.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(children: [const Icon(Icons.chair_outlined,size: 15),const SizedBox(width: 5),Text(travel.busType,style: const TextStyle(fontSize: 13),)]),
                                   Row(children: [const Icon(Icons.access_time,size: 15,color: Colors.red,),const SizedBox(width: 3),Text(travel.arrivalTime,style: const TextStyle(fontSize: 15,color: Colors.red),)],)
                                 ],
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("${widget.from} Otogarı > ${widget.to} Otogarı",style: const TextStyle(fontSize: 12,color: Colors.black54)),
                                 Row(
                                   children: [
                                     Icon(Icons.arrow_drop_down ,size: 15,),
                                     const SizedBox(width: 5,),
                                     Text("İncele",style: const TextStyle(fontSize: 12,color: Colors.black)),
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                 );
               }
             ),
           );
         }else{
           return Container();
         }
       },)
      ],
      ),
    );
  }
}
