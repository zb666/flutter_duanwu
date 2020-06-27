/// name : "Bob"
/// age : 123

class UserBeanInfo {
  String name;
  int age;

  static UserBeanInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    UserBeanInfo customDialogBean = UserBeanInfo();
    customDialogBean.name = map['name'];
    customDialogBean.age = map['age'];
    return customDialogBean;
  }

  Map toJson() => {
    "name": name,
    "age": age,
  };
}