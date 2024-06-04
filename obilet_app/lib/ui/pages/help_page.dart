
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Yardım",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xffd23b38),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ContainerItem("Otobüs biletimi nasıl açığa alabilirim?", () {}),
            ContainerItem("Otobüs biletimi nasıl değiştirebilirim?", () { }),
            ContainerItem("Otobüs biletimi nasıl iptal ederim?", () { }),
            ContainerItem("Açığa aldığım otobüs biletimi nasıl kullanabilirim?", () { }),
            ContainerItem("Otobüs biletimi nasıl görebilirim?", () { }),
            ContainerItem("Kampanya kodları nasıl kullanılabilir?", () { }),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

class ContainerItem extends StatelessWidget {
  String text;
  VoidCallback? fun;
  ContainerItem(this.text,this.fun, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),border: Border.all(color: Colors.black26)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Icon(Icons.arrow_forward_ios,size: 15,),
            ],
          ),
        ),
      ),
    );
  }
}

