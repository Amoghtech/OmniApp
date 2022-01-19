import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  var _subjectImage;

  bool _isLoading = false;

  Future getGalleryImage() async {
    setState(() {
      _subjectImage = null;
    });
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _subjectImage = image as PickedFile;
    });
  }

  Future getCameraImage() async {
    setState(() {
      _subjectImage = null;
    });
    final image =
        // ignore: invalid_use_of_visible_for_testing_member
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    setState(() {
      _subjectImage = image as XFile;
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
                      'Subject',
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
                        image: _subjectImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  File(_subjectImage.path),
                                ),
                              )
                            : null,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      height: 300,
                      child: Center(
                        child: _subjectImage != null
                            ? null
                            : Center(
                                child: Text('Add an Image'),
                              ),
                      ),
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
                          child: Text('Upload from Gallery'),
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
                  Navigator.of(context).pop();
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
