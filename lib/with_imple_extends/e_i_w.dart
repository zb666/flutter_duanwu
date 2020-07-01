

abstract class A{

  int personNum;

   void a(){

  }

  void b(){

  }

  abs();

}

class B extends A{

  @override
  abs() {

  }
}

class C implements A{
  @override
  int personNum;

  @override
  void a() {
    // TODO: implement a
  }

  @override
  abs() {
    // TODO: implement abs
    throw UnimplementedError();
  }

  @override
  void b() {
    // TODO: implement b
  }

}


class D{
  d(){

  }
}

class E with A,D{

  @override
  void a() {
    super.a();
  }

  @override
  abs() {

  }


}