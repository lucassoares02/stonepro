import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stonepro/src/components/spacing.dart';
import 'package:stonepro/src/remain/remain_controller.dart';
import 'package:stonepro/src/state/state_app.dart';
import 'package:stonepro/src/uitls/spacing.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key, required this.remainController});

  final RemainController remainController;

  @override
  UploadFileState createState() => UploadFileState();
}

class UploadFileState extends State<UploadFile> {
  final ImagePicker picker = ImagePicker();

  getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      widget.remainController.images.add(File(pickedFile.path));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int count = widget.remainController.images.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[50]),
          padding: const EdgeInsets.symmetric(vertical: appPadding),
          height: widget.remainController.images.isNotEmpty ? 300 : 0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: appPadding, right: index == count - 1 ? appPadding : 0),
                child: Stack(
                  children: [
                    ValueListenableBuilder(
                        valueListenable: widget.remainController.stateSaveFiles,
                        builder: (context, value, child) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(appRadius),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(
                                    value == StateApp.loading ? 0.5 : 0), // Defina aqui a cor e a opacidade desejada
                                BlendMode.srcATop,
                              ),
                              child: Image.file(
                                widget.remainController.images[index],
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                    Positioned(
                        top: 240,
                        left: 150,
                        child: Text("--:--", style: TextStyle(color: Colors.white.withOpacity(0.5))))
                  ],
                ),
              );
            },
          ),
        ),
        const AppSpacing(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton.icon(
                onPressed: getImage,
                icon: const Icon(
                  Icons.photo_camera,
                  size: 30,
                ),
                label: const Text("Adicionar Foto"))
          ],
        )
      ],
    );
  }
}
