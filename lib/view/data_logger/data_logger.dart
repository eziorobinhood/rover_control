import 'package:antpod/controller/remote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataLogger extends StatelessWidget {
  DataLogger({super.key});
  final RemoteController remoteController = Get.put(RemoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Data logger'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          children: List.generate(
            remoteController.presseditems.length,
            (index) => Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: double.infinity,
                height: 20,
                child: FittedBox(
                  child: Text(
                    remoteController.presseditems[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ElevatedButton(
                onPressed: () => remoteController.presseditems.clear(),
                child: const Text(
                  'Reset',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ElevatedButton(
                onPressed: () => remoteController.convertToCsv(),
                child: const Text(
                  'Export',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
