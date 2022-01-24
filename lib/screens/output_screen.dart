import 'package:flutter/material.dart';
import '../providers/services.dart' show GenderClassification;

class ImageOutput extends StatefulWidget {
  const ImageOutput({Key? key}) : super(key: key);
  @override
  State<ImageOutput> createState() => _ImageOutputState();
}

class _ImageOutputState extends State<ImageOutput> {
  var output;
  @override
  void didChangeDependencies() {
    output = ModalRoute.of(context)!.settings.arguments;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Image Process Results :',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(output['image']),
                ),
              ),
            ),
            Text(
              output['gender'] == '0 Men' ? 'Men' : 'Women',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
