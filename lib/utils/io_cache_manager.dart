

import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class IoCacheManager extends BaseCacheManager{

  static const key = 'IoCacheManager';

  static const CACHE_URL = 'http://img3.dian.so/lhc/2019/11/13/1080w_2244h_DF87D1573635417.png';

  IoCacheManager(String cacheKey) : super(cacheKey);

  @override
  Future<String> getFilePath() async{
    var fileInfo = await getFileFromCache(CACHE_URL);

    var file = File(key).readAsBytesSync();
    putFile("url", file);
    var directory = await getTemporaryDirectory();
    return p.join(directory.path, key);
  }

}