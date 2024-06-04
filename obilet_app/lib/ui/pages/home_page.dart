

import 'package:flutter/material.dart';
import 'package:obilet_app/ui/pages/travel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _selectedFrom="Ankara";
  late String _selectedTo="Antalya";
  final List<String> _neredenList = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"
  ];

  final List<String> _nereyeList = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"
  ];
  String selectedDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffd23b38),
        centerTitle: true,
        title: const Text("obilet",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(right: 32.0,left: 32.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      iconSize: 10,
                      value: _selectedFrom,
                      items: _neredenList.map((String nereden) {
                        return new DropdownMenuItem<String>(
                          value: nereden,
                          child: new Text(nereden),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedFrom = newValue!;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'NEREDEN',labelStyle: TextStyle(color: Colors.red)),
                    ),
                    DropdownButtonFormField(
                      iconSize: 10,
                      value: _selectedTo,
                      items: _nereyeList.map((String nereye) {
                        return new DropdownMenuItem<String>(
                          value: nereye,
                          child: new Text(nereye),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedTo = newValue!;
                        });
                      },
                      decoration: const InputDecoration(labelText: 'NEREYE',labelStyle: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 32.0,left: 32.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),

              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(

                  children: [
                    const Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.date_range_outlined),
                            SizedBox(height: 50,),
                          ],
                        ),
                      ],
                    ),
                 SizedBox(width: 10,),
                 //button
                    Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              InkWell(
                                onTap:() {
                                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2025)).then((value) {
                                    selectedDate = "${value!.day}/${value!.month}/${value!.year}";
                                    setState(() {

                                    });
                                  });
                                },
                                child : Column(
                                    children: [
                                      Text("Gidiş tarihi",style: TextStyle(color: Colors.red),),
                                      Text(selectedDate != "" ? "$selectedDate" : "Gidiş tarihi seçiniz"
                                      ),
                                      Row(

                                        children: [

                                          TextButton(
                                              onPressed: () {

                                              }, child: const Text("Bugün",style: TextStyle(color: Colors.blueGrey,fontSize: 12),)),
                                          TextButton(onPressed: () {

                                          }, child: const Text("Yarın",style: TextStyle(color: Colors.blueGrey,fontSize: 12)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0,left: 40),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 40,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff1f9b78),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
                    ),
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TravelPage(_selectedFrom, _selectedTo,selectedDate!),));

                  }, child: Text("Otobüs Ara",style: TextStyle(color: Colors.white),)),
                ),
              ),
              Text("Kesintisiz iade Hakkı ve 0 Komisyon",style: TextStyle(fontSize: 8,color: Colors.grey),),
            ],
          ),
        ],
      ),
    );
  }
}
