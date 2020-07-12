import 'package:flutter/material.dart';
import 'package:flutterduanwu/pages/provider/common_modify_provider.dart';
import 'package:provider/provider.dart';

class SelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommonModifyProvider>(
      create: (_) => CommonModifyProvider.instance,
      child: ListView(
          children: List.generate(10, (index) =>
              Selector<CommonModifyProvider, String>(
                  shouldRebuild: (pre, next) {
                    return pre != next;
                  },
                  builder: (context, data, __) {
                    print('build invoke:$index $data');
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                          onTap: () {
                            Provider.of<CommonModifyProvider>(context, listen: false).changeValue();
                          },
                          child: Text('Value Result:$data',style: TextStyle(fontSize: 20),)),
                    );
                  },
                  selector: (context, store) => store.commonList[index]))
      ),
    );
  }


}
