class CarInfoMode {
  String goodsId;
  String goodsName;
  int count;
  double price;
  String images;
  bool isCheck;

  CarInfoMode.name(
      {this.goodsId,
      this.goodsName,
      this.count,
      this.price,
      this.images,
      this.isCheck});

  CarInfoMode.fromJson(Map<String, dynamic> map) {
    goodsId = map['goodsId'];
    goodsName = map['goodsName'];
    count = map['count'];
  }

  Map<String, dynamic> toMapJson() {
    final Map<String, dynamic> data = new Map();
    data['goodsId'] = goodsId;
    data['goodsName'] = goodsName;
    return data;
  }
}
