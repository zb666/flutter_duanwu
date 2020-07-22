import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/provider/common_modify_provider.dart';
import 'package:provider/provider.dart';

class SelectorPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _nextNode = FocusNode();
  final FocusNode _emptyNode = FocusNode();

  final FocusNode _emptyNode2 = FocusNode();

  final list = ['A', 'B', 'C', 'D', 'E'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SafeArea(
        child: ChangeNotifierProvider<CommonModifyProvider>(
          create: (_) => CommonModifyProvider.instance,
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_emptyNode),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Text('Title'),
                    )),
                    SliverList(delegate: SliverChildListDelegate(
                      [
                        Padding(padding: EdgeInsets.all(10)),
                        SizedBox(child: Text('AAAAA'),height: 100),
                        Icon(Icons.access_time),
                        SizedBox(child: Text('BBBBB'),height: 100),
                        SizedBox(child: Text('CCCCCCCCCCCCCCCCCCCC',textAlign: TextAlign.center),height: 100),
                      ]
                    )),
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate((context, pos) {
                          return SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(child: Text('$pos')));
                        },childCount: 100),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 5))
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
