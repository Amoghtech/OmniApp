import 'dart:io';

import 'package:tflite/tflite.dart';

class GenderClassification {
  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );
    return output;
  }

  Future loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/model_unquant.tflite",
      labels: 'assets/model/labels.txt',
      numThreads: 1,
    );
  }

  void dispose() {
    Tflite.close();
  }
}
