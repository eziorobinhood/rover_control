import 'dart:convert';
import 'dart:typed_data';

import 'package:antpod/controller/remote_controller.dart';
import 'package:antpod/helpers/sizes.dart';
import 'package:antpod/view/blutooth/bluetooth_serial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class OnandOffButton extends StatelessWidget {
  OnandOffButton({
    Key? key,
    required this.device,
    required this.txt,
    required this.textColor,
    required this.btnColor,
    required this.index,
  }) : super(key: key);

  final String txt;
  final Color textColor;
  final Color btnColor;
  final int index;
  final BluetoothDevice device;
  final RemoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.addTimes(button: '$index $txt'),
      child: Container(
        height: height(context) * 0.05,
        width: width(context) * 0.30,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
          color: btnColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: Text(txt),
          ),
        ),
      ),
    );
  }
}
