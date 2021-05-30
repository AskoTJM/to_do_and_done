import 'dart:io';

import 'package:path_provider/path_provider.dart';

// Not currently used.
Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/data.json';

  return filePath;
}

void saveFile(dataToSave) async {
  File file = File(await getFilePath());
  //String writeString = jsonEncode(dataToSave);
  file.writeAsString(dataToSave);
}

Future<String> readFile() async {
  File file = File(await getFilePath());
  String fileContent = await file.readAsString();

  return fileContent;
}
