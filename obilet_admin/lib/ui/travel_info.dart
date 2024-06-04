import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/data/model/travel_model.dart';
import 'package:obilet_admin/ui/cubits/travel_info_cubit.dart';

class TravelInfo extends StatefulWidget {
  TravelModel model;

  TravelInfo(this.model, {super.key});
  @override
  State<TravelInfo> createState() => _TravelInfoState();
}

class _TravelInfoState extends State<TravelInfo> {
  TextEditingController priceController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sefer Düzenle"),backgroundColor: Color(0xffd23b38),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 100,),
              BasicTextForm(hintText: widget.model.price, labelText: "price", obscureText: false,controller: priceController,focusNode: FocusNode()),
              BasicTextForm(hintText: widget.model.departureTime, labelText: "departureTime", obscureText: false,controller: departureTimeController,focusNode: FocusNode()),
              BasicTextForm(hintText: widget.model.arrivalTime, labelText: "arrivalTime", obscureText: false,controller: arrivalTimeController,focusNode: FocusNode()),
              BasicTextForm(hintText: widget.model.date, labelText: "date", obscureText: false,controller: dateController,focusNode: FocusNode()),
              TextButton(style: TextButton.styleFrom(backgroundColor: Color(0xffd23b38),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                  onPressed:() {
                context.read<TravelInfoCubit>().updateTravel(priceController.text, arrivalTimeController.text, departureTimeController.text, dateController.text, widget.model.docId).then((value) => Navigator.pop(context));
                  }, child: Text("Kaydet",style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}

class BasicTextForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;

  BasicTextForm({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black38, fontSize: 13),
        label: Text(
          labelText,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
