import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/provider/common_modify_provider.dart';
import 'package:provider/provider.dart';

class SelectorPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _nextNode = FocusNode();
  final FocusNode _emptyNode = FocusNode();

  final FocusNode _emptyNode2 = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: SafeArea(
        child: ChangeNotifierProvider<CommonModifyProvider>(
          create: (_) => CommonModifyProvider.instance,
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GestureDetector(
                onTap: ()=>FocusScope.of(context).requestFocus(_emptyNode),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.greenAccent,width: 2)
                              )
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _controller,
                        cursorWidth: 2.0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).unfocus(),
                          child: Text('333',style: TextStyle(fontSize: 20),)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child:
                          TextField(focusNode: _nextNode, controller: TextEditingController()),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
