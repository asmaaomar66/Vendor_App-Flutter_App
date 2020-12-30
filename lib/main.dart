//import 'package:flutter/material.dart';
//import 'Vendorapp/productscreenView.dart' ;
//
//
//void main(){
//  runApp(new MaterialApp(
//    title : 'E-Shopping' ,
//    theme: new ThemeData(
//      primarySwatch: Colors.pink ,
//    ),
//    home:  new ProductScreen(),
//  ),
//  );
//}
import 'package:flutter/material.dart';
import 'package:shopp/screens/AddProduct.dart';
import 'package:shopp/screens/AddProduct.dart' ;
import 'package:shopp/screens/HelloApp.dart';

void main() => runApp(new MaterialApp(home: new MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(



      routes: <String, WidgetBuilder>{
        '/HelloApp': (BuildContext context) => new AddProduct(),
        '/HelloApp': (BuildContext context) => new HelloApp(),
        //  '/': (BuildContext context) => new DeleteProduct(),
      },
      home: new HelloApp()

      ,

    );
  }

}


