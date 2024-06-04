

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var pnr = 023552;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffd23b38),
        title: Text("Seyehatlerim",style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("PNR Numarası ile Bilet Sorgula",style: TextStyle(fontSize: 14,),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 16.0,bottom: 8.0),
            child: Card(
              surfaceTintColor: Colors.grey,
              elevation: 2,
              shape: BeveledRectangleBorder(borderRadius: BorderRadiusDirectional.circular(2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/pamukkale_logo.png",height: 50,),
                        Text("Sefer Gerçekleşti",style: TextStyle(fontSize: 11),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black38,
                      ),
                    ),
                    Text("Ankara Otogarı - Denizli Otogarı",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                    Text("30 Nisan 2024 Salı - 22:30",style: TextStyle(fontSize: 12),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.black38,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("FATİH BİÇGİ",style: TextStyle(color: Colors.black87,fontSize: 13),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PNR \n${pnr}",style: TextStyle(fontSize: 12,color: Colors.black87),),
                            Text("KOLTUK NO \n 19",style: TextStyle(fontSize: 12,color: Colors.black87),),
                            Text("FİYAT \n400 TL",style: TextStyle(fontSize: 12,color: Colors.black87)),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.black38),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Toplam Tutar:"),
                        Text("400 TL")
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
