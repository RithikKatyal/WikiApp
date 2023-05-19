import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProvider{
  static late String path;
  static Future<void> getPath() async{
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    path = appDocumentsDir.path;
  }
}