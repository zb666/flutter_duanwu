class GlobalInit{

  static String name = "static";

  static Future init() async{
    await Future.delayed(const Duration(seconds: 1));
  }

}