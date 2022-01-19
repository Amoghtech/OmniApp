import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EvidenceScreen extends StatefulWidget {
  @override
  State<EvidenceScreen> createState() => _EvidenceScreenState();
}

class _EvidenceScreenState extends State<EvidenceScreen> {
  var _evidenceImage;
  bool _isLoading = false;

  Future getGalleryImage() async {
    setState(() {
      _evidenceImage = null;
    });
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _evidenceImage = image as PickedFile;
    });
  }

  Future getCameraImage() async {
    setState(() {
      _evidenceImage = null;
    });
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    setState(() {
      _evidenceImage = image as XFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/main_logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Evidence',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: _evidenceImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(_evidenceImage.path),
                                ),
                              )
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      height: 300,
                      child: _evidenceImage != null
                          ? null
                          : Center(child: Text('Add an Image')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15),
                            ),
                          ),
                          onPressed: () {
                            getCameraImage();
                          },
                          child: Text('Take from Camera'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15),
                            ),
                          ),
                          onPressed: () {
                            getGalleryImage();
                          },
                          child: Text('Import From Gallery'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/subject');
                },
                child: Text('Add the Subject'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
