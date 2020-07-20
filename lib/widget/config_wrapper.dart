import 'package:flutter/material.dart';
import 'package:flutterduanwu/config/config.dart';
import 'package:flutterduanwu/env/env_config.dart';

typedef InheritedBuilder = Widget Function(EnvConfig config, Widget child);

class ConfigWrapper extends StatelessWidget {

  final EnvConfig envConfig;

  final Widget child;

  ConfigWrapper({this.envConfig, this.child});

  @override
  Widget build(BuildContext context) {
    Config.DEBUG = this.envConfig.debug;
    debugPrint("$ConfigWrapper build ${Config.DEBUG}");
    return _InheritedConfig(child: child, config: envConfig);
  }

  static EnvConfig of(BuildContext buildContext) {
    var _inheritedConfig =
        buildContext.dependOnInheritedWidgetOfExactType<_InheritedConfig>();
    return _inheritedConfig.config;
  }
}

class _InheritedConfig extends InheritedWidget {
  final EnvConfig config;

  _InheritedConfig({Key key, this.config, @required Widget child})
      : assert(child != null),
        super(key: key, child: child);

  //取决于数据是否相同
  @override
  bool updateShouldNotify(_InheritedConfig oldWidget) =>
      config != oldWidget.config;
}
