import 'package:dio/dio.dart';

typedef InterceptorCallback = dynamic Function(RequestOptions requestOptions);
void main() {
//    Dio()
//      ..get('https://wanandroid.com/wxarticle/chapters/json',queryParameters: {'id':12,'name':'wendu'})
//          .then((value) => print(value.data));

  var dio = Dio();
  dio.interceptors.add(InterceptorsWrapper(

    onRequest: (options) async{
      print('InterceptorsWrapper options: $options');

    },

    onResponse: (response) async{
      print('InterceptorsWrapper response: $response');
      return response;
    },

    onError: (DioError dioError) async{
      print('InterceptorsWrapper dioError: $dioError');
    }

  ));

  dio.interceptors.add(DioInterceptor());

  dio.post('http://www.dtworkroom.com/doris/1/2.0.0/test',
      data: {'aa': 'bb' * 22}, onSendProgress: _sendProgress)
    ..then((value) => print(value.data));

}

void _sendProgress(int count, int total) {
  print('total:$total count:$count');
}

class DioInterceptor extends Interceptor{
  @override
  Future onRequest(RequestOptions options) {
    print('DioInterceptor options: ${options.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('DioInterceptor response: ${response.data}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }


}
