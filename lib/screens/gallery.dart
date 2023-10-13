import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_designs/db/functions/db_functions.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GALLERY'),
        ),
        body: ValueListenableBuilder(
          valueListenable: cameraListNotifier,
          builder: (context, value, child) => GridView.builder(
            itemCount: value.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(File(value[index])), fit: BoxFit.cover),
              ),
            ),
          ),
        ));
  }
}

