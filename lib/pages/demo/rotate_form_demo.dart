import 'package:flutter/material.dart';

class RotateTransform extends StatefulWidget {
  @override
  _RotateTransformState createState() => _RotateTransformState();
}

class _RotateTransformState extends State<RotateTransform> {
  Matrix4 _m4;
  double _x = 0;
  int _rotateFlag = 1;

  double pi = 0;

  double _curValue = 0;

  @override
  void initState() {
    _m4 = Matrix4.identity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[_buildTransform()],// Matrix4Shower(_m4)
        ),
        _buildSliders(),
        Slider(
            min: 0,
            max: 100,
            value: _curValue,
            label: 'CurValue: $_curValue',
            onChanged: (value) {
              setState(() {
                _curValue = value;
              });
              debugPrint('CurValue: $value');
            }),
      ],
    );
  }

  Widget _buildTransform() {
    if (_rotateFlag == 1) {
      _m4 = Matrix4.rotationX(_x);
    } else if (_rotateFlag == 2) {
      _m4 = Matrix4.rotationY(_x);
    } else {
      _m4 = Matrix4.rotationZ(_x);
    }

    return Transform(
      transform: _m4,
      child: Container(
          color: Colors.cyanAccent,
          width: 100,
          height: 100,
          child: Image.asset(
            'assets/images/background_banner.webp',
            fit: BoxFit.cover,
          )),
    );
  }

  final Map<int, String> map = {
    1: 'rotationX',
    2: 'rotationY',
    3: 'rotationZ',
  };

  Widget _buildSliders() => Column(
    children: <Widget>[
      Wrap(
        children: map.keys.map((key) => _buildChild(key)).toList(),
      ),
      Slider(
          min: 0,
          max: 100,
          value: _x,
          divisions: 10,
          label: 'x:${_x.toStringAsFixed(1)}',
          activeColor: Colors.red,
          onChanged: (v) {
            setState(() {
              _x = v;
            debugPrint('RotateValue: $v');
            });
          }),
    ],
  );

  Padding _buildChild(int key) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FilterChip(
        selectedColor: Colors.orange.withAlpha(55),
        selectedShadowColor: Colors.blue,
        shadowColor: Colors.orangeAccent,
        pressElevation: 5,
        elevation: 3,
        avatar: CircleAvatar(child: Text(key.toString())),
        label: Text(map[key]),
        selected: _rotateFlag == key,
        onSelected: (bool value) {
          print(map[key]);
          setState(() {
            _x = 0;
            if (value) {
              _rotateFlag = key;
            }
          });
        },
      ),
    );
  }
}

class Matrix4Shower {
}