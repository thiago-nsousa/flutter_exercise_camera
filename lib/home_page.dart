import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter_exercise_camera/attachment.dart';
import 'package:flutter_exercise_camera/preview_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? file;
  final picker = ImagePicker();

  // Future getFileFromGallery() async {
  //   XFile? file = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() => arquivo = XFile(file.path));
  // }

  showPreview() async {
    // File? arq = await Get.to(() => PreviewPage(file: file));
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    setState(() => file = xFile != null ? File(xFile.path) : null);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envie seu Comprovante'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (file != null) AttachmentWidget(file: file!),
                ElevatedButton.icon(
                  onPressed: () => showPreview(),
                  icon: const Icon(Icons.camera_alt),
                  label: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Tire uma foto'),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      textStyle: const TextStyle(
                        fontSize: 18,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('ou'),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.attach_file),
                  label: const Text('Selecione um arquivo'),
                  onPressed: () => {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
