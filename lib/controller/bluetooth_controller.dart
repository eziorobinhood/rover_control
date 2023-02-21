import 'dart:developer';
import 'package:antpod/view/remote/remote.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  final FlutterBluetoothSerial _bluetoothSerial =
      FlutterBluetoothSerial.instance;
  BluetoothConnection? connection;
  List<BluetoothDevice> devicesList = [];
  BluetoothDevice? connectedDevice;
  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  bool get isConnected => connection != null && connection!.isConnected;

  Future<void> enableBluetooth() async {
    BluetoothState bluetoothState = await FlutterBluetoothSerial.instance.state;
    if (bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
    } else {
      await getPairedDevices();
    }
    update();
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await _bluetoothSerial.getBondedDevices();
    } on PlatformException {
      log("Error");
    }
    devicesList = devices;
    update();
  }

  void connect(BluetoothDevice device) async {
    if (!isConnected) {
      await BluetoothConnection.toAddress(device.address).then((connections) {
        connection = connections;
        isConnected
            ? Get.off(ChatPage(server: device))
            : Get.snackbar('Connect a device',
                'At least connect to one device to go to next page');
      }).catchError((error) {
        log(' error on connection ---------------$error');
      });
    }
    update();
  }

  Future<BluetoothDevice?> connectedDeviceFetch() async {
    for (var element in devicesList) {
      if (element.isConnected) {
        return element;
      }
    }
    return null;
  }

  Future<void> initialize() async {
    await enableBluetooth();
    connectedDevice = await connectedDeviceFetch();

    if (connectedDevice != null) {
      connection =
          await BluetoothConnection.toAddress(connectedDevice!.address);
    }

    isConnected
        ? Get.off(() => ChatPage(
              server: connectedDevice!,
            ))
        : Get.snackbar(
            'Warning', 'At least connect to one device to go to next page');
  }
}
