import 'package:antpod/controller/remote_controller.dart';
import 'package:antpod/helpers/colors.dart';
import 'package:antpod/view/remote/widgets/on_and_off_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import '../../../helpers/sizes.dart';
import '../../data_logger/data_logger.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key,
      required this.txt,
      required this.btncolor,
      required this.device})
      : super(key: key);
  final RemoteController controller = Get.find();
  final String txt;
  final Color btncolor;
  BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => txt == 'Data Logger'
          ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DataLogger();
            }))
          : controller.addTimes(button: txt),
      child: Container(
        height: height(context) * 0.07,
        width: width(context) * 0.4,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
          color: btncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              Get.snackbar("BTMsg", "Device connected");
            },
            child: Text(txt),
          ),
        ),
      ),
    );
  }
}
