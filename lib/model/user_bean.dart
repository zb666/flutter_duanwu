
class UserModel {
  String name;
  int age;

//  UserModel({this.name, this.age});

  UserModel.fromJson(Map<String,dynamic> json){
     name = json['name'];
     age = json['age'];
  }

  factory UserModel(Map<String,dynamic> mapJson){
    return UserModel._internalInit(mapJson);
  }

  UserModel._internalInit(Map<String,dynamic> json){
    name = json['name'];
    age = json['age'];
  }

  //json在这里就是Map类型的
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map();
    data['name'] = name;
    data['age'] = age;
    return data;
  }

}
