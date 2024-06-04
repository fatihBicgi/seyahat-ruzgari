
class ProfileModel{
  String name;
  String surname;
  String date;
  String identityId;
  String phone;
  String mail;
  String gender;
  String status;
  ProfileModel(
      {required this.name,
      required this.surname,
      required this.date,
      required this.identityId,
      required this.phone,
      required this.mail,
      required this.gender,
      required this.status});

 factory ProfileModel.fromJson(Map<dynamic,dynamic> json,String key){
    return ProfileModel(name: json["name"] ?? "",
        surname: json["surname"] ?? "",
        date: json["date"] ?? "",
        identityId: json["identityId"] ?? "",
        phone: json["phone"] ?? "",
        mail: json["mail"] ?? "",
        gender: json["gender"] ?? "",
        status: json["status"]
    );
  }
}