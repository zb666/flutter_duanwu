
//class TestWidget extends StatelessWidget {
//
//  final String title;
//
//  final int count;
//
//  TestWidget({this.title, this.count})
//      : assert(count > 0),
//        assert(title != null);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//
//}


void main(){
  var son = Son(10, 20);

}


class Parent{

  num x;

  num y;

//  Parent(this.x, this.y){
//    print('Parent Init:$x $y');
//  }

  //初始化列表，相当于将之前的过程用this.num简化了
  Parent(num nx,num ny):x = nx,y = ny{
    print('Parent init:  $x $y');
  }

}

class Son extends Parent{

  Son(num x, num y) : super(x, y){
    print('Son init :$x $y');
  }


}
