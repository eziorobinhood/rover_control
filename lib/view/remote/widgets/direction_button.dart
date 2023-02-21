import 'package:antpod/controller/remote_controller.dart';
import 'package:antpod/helpers/colors.dart';
import 'package:antpod/helpers/sizes.dart';
import 'package:antpod/view/remote/widgets/on_and_off_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class UpandDownButton extends StatelessWidget {
  UpandDownButton({Key? key, required this.txt, required this.device})
      : super(key: key);
  final String txt;
  final RemoteController controller = Get.find();
  BluetoothDevice device;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.addTimes(button: txt),
      child: Container(
        height: height(context) * 0.07,
        width: width(context) * 0.3,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
          border: Border.all(color: black),
          color: const Color.fromARGB(255, 16, 172, 211),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(
          child: TextButton(
            child: Text(txt),
            onPressed: () {
              Get.snackbar("Btmsg", "Connected");
            },
          ),
        ),
      ),
    );
  }
}
