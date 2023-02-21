import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:share_plus/share_plus.dart';

class RemoteController extends GetxController {
  final List<String> presseditems = [];
  List<List<dynamic>?>? data = [[]];
  void addTimes({required String button}) {
    presseditems.add('$button Pressed on : ${DateTime.now()}');
  }

  void convertToCsv() async {
    data![0]!.addAll(presseditems);
    String csvData = const ListToCsvConverter().convert(data);
    log(csvData);
    Share.share(csvData, subject: 'Remote Data Logger (CSV)');
  }
}
