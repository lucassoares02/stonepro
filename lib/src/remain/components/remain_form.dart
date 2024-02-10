import 'package:stonepro/src/components/image_bucket.dart';
import 'package:stonepro/src/components/loading_component.dart';
import 'package:stonepro/src/model/remain.dart';
import 'package:stonepro/src/remain/components/input_component.dart';
import 'package:stonepro/src/remain/components/upload_file.dart';
import 'package:stonepro/src/remain/remain_controller.dart';
import 'package:stonepro/src/components/spacing.dart';
import 'package:stonepro/src/state/state_app.dart';
import 'package:stonepro/src/uitls/decoration.dart';
import 'package:flutter/material.dart';
import 'package:stonepro/src/uitls/spacing.dart';

class RemainForm extends StatelessWidget {
  const RemainForm({Key? key, required this.remainController, this.remain}) : super(key: key);

  final RemainController remainController;
  final Remain? remain;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: remainController.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                if (remain != null)
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: remain!.images!.map(
                        (imagesss) {
                          return Padding(
                            padding: const EdgeInsets.all(appPadding),
                            child: ImageBucket(
                              idImage: imagesss,
                              width: size.width - (appPadding * 2),
                              height: 300,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputComponent(
                        value: remain?.description,
                        label: "Descrição",
                        textEditingController: remainController.descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Insira uma descrição!';
                          }
                          return null;
                        },
                      ),
                      const AppSpacing(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: InputComponent(
                              value: remain?.width,
                              label: "Largura",
                              textEditingController: remainController.widthController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Insira um tamanho!';
                                }
                                return null;
                              },
                            ),
                          ),
                          const AppSpacing(),
                          Flexible(
                            flex: 1,
                            child: InputComponent(
                              value: remain?.length,
                              label: "Altura",
                              textEditingController: remainController.lengthController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Insira um altura!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (remain == null) UploadFile(remainController: remainController),
              ],
            ),
            if (remain == null)
              Padding(
                padding: const EdgeInsets.all(appPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: remainController.stateCreate,
                          builder: (context, value, child) {
                            bool loading = value == StateApp.loading;
                            return ElevatedButton(
                              style: buttonStyle(color: loading ? Colors.grey[300] : Colors.blue[600]),
                              onPressed: loading
                                  ? null
                                  : () {
                                      if (remainController.formKey.currentState!.validate()) {
                                        // Form is valid, save data or perform any desired action
                                        // Access form data using controllers:
                                        // _descriptionController.text, _widthController.text, etc.
                                        remainController.create();
                                      }
                                    },
                              child: loading
                                  ? const LoadingComponent()
                                  : const Text(
                                      'Salvar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
