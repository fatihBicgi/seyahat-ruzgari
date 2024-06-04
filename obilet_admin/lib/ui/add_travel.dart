


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilet_admin/data/model/travel_model.dart';
import 'package:obilet_admin/ui/cubits/add_travel_cubit.dart';
import 'package:obilet_admin/ui/login.dart';

class AddTravel extends StatefulWidget {
  const AddTravel({Key? key}) : super(key: key);

  @override
  State<AddTravel> createState() => _AddTravelState();
}

class _AddTravelState extends State<AddTravel> {

  List<CompanyModel> companies = [
    CompanyModel(companyName: 'Pamukkale',companyImage: "https://firebasestorage.googleapis.com/v0/b/obiletapp.appspot.com/o/pamukkale_logo.png?alt=media&token=7ffee4be-8a64-4115-b79e-207361639fde"),
    CompanyModel(companyName: 'Isparta Petrol Turizm',companyImage: "https://firebasestorage.googleapis.com/v0/b/obiletapp.appspot.com/o/2671-sm.png?alt=media&token=f4d705f9-b834-476d-b097-7748a4c44b0b"),
    CompanyModel(companyName: 'Kamil Koç',companyImage: "https://firebasestorage.googleapis.com/v0/b/obiletapp.appspot.com/o/3195-sm.png?alt=media&token=a0ca08c8-a201-4b0f-a089-bb563d98e437"),
    CompanyModel(companyName: 'Ali Osman Ulusoy',companyImage: "https://firebasestorage.googleapis.com/v0/b/obiletapp.appspot.com/o/2223-sm.png?alt=media&token=e4be71f9-8b62-4f06-b218-e3d0f2d6db0a"),
  ];
  CompanyModel? selectedCompany;
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController arrivalTimeController = TextEditingController();
  TextEditingController departureTimeController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();
  TextEditingController departureController = TextEditingController();
  TextEditingController totalSeatsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sefer Ekle"),
      ),
      body: Column(
        children: [
            DropdownButton<CompanyModel>(
            hint: Text('Şirket Seç'),
            value: selectedCompany,
            onChanged: (CompanyModel? newValue) {
              setState(() {
                selectedCompany = newValue!;
              });
            },
            items: companies.map((CompanyModel company) {
              return DropdownMenuItem<CompanyModel>(
                value: company,
                child: Text(company.companyName),
              );
            }).toList(),
          ),

        BasicTextForm(hintText: "fiyat", labelText: "Fiyat", obscureText: false, controller: priceController, focusNode: FocusNode()),
        BasicTextForm(hintText: "gg/a/yyyy", labelText: "Tarih", obscureText: false, controller: dateController, focusNode: FocusNode()),
        BasicTextForm(hintText: "Antalya", labelText: "Kalkış", obscureText: false, controller: departureController, focusNode: FocusNode()),
        BasicTextForm(hintText: "Ankara", labelText: "Varış", obscureText: false, controller: arrivalController, focusNode: FocusNode()),
        BasicTextForm(hintText: "40", labelText: "Koltuk Sayısı", obscureText: false, controller: totalSeatsController, focusNode: FocusNode()),
        BasicTextForm(hintText: "3:15", labelText: "Tahmini Varış Saati", obscureText: false, controller: arrivalTimeController, focusNode: FocusNode()),
        BasicTextForm(hintText: "12:00", labelText: "Kalkış saati", obscureText: false, controller: departureTimeController, focusNode: FocusNode()),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Color(0xffd23b38)),
            onPressed: () {
           context.read<AddTravelCubit>().addTravel(
                TravelModel(
                    arrival: arrivalController.text,
                    departure: departureController.text,
                    arrivalTime: arrivalTimeController.text,
                    departureTime: departureTimeController.text,
                    price: priceController.text,
                    companyName: selectedCompany!.companyName,
                    companyImage: selectedCompany!.companyImage,
                    totalSeats: totalSeatsController.text,
                    busType: "2+1",
                    docId: "", date: dateController.text));
        }, child: Text("Sefer Ekle",style: TextStyle(color: Colors.white)))
    ],
      ),
    );
  }
}



class CompanyModel {
  final String companyName;
  final String companyImage;
  CompanyModel({required this.companyName,required this.companyImage});
}

