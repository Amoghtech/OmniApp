import 'package:flutter/material.dart';

class EvidenceScreen extends StatelessWidget {
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
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      height: 300,
                      child: Center(child: Text('Add an Image')),
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
                          onPressed: () {},
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
                          onPressed: () {},
                          child: Text('Take from Camera'),
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
