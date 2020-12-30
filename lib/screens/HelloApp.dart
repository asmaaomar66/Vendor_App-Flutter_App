import 'package:flutter/material.dart';
import 'package:shopp/screens/AddProduct.dart';

class HelloApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HelloApp();
  }
}

class _HelloApp extends State<HelloApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

        appBar: new AppBar(
          backgroundColor:  Color.fromRGBO(75, 142, 141, 30),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,

              ),
              onPressed: () {
                // do something
              },
            )
          ],
          title: new Text("Vendor App"),
        ),
        backgroundColor:  Color.fromRGBO(255, 231, 209, 30),
        body: ListView(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.only(top: 80.0,bottom: 45.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor:  Color.fromRGBO(75, 142, 141, 30),


                    maxRadius: 87.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,

                          ),
                          onPressed: () {
                            Navigator.push(context,new MaterialPageRoute(
                                builder:(context)=>AddProduct()
                            ));
                          },
                        ),
                        new SizedBox(
                          height: 3.0,
                        ),
                        new Text("Add Product", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  ),
                ],


              ),
            ),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircleAvatar(
                    backgroundColor:  Color.fromRGBO(75, 142, 141, 30),

                    maxRadius: 87.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,

                          ),
                          onPressed: () {
                            // do something
                          },
                        ),
                        new SizedBox(
                          height: 3.0,
                        ),
                        new Text("Delete Product",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ),
                  ),
                ],


              ),
            ),
          ],
        )


    );
  }
}
