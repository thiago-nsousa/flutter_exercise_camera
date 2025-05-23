import 'dart:io';

import 'package:flutter/material.dart';

class AttachmentWidget extends StatelessWidget {
  final File file;

  const AttachmentWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
