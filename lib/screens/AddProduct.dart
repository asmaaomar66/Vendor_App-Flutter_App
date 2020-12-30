import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopp/screens/HelloApp.dart';
import 'package:toast/toast.dart';

class AddProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AddProduct();
  }
}

class _AddProduct extends State<AddProduct> {
  List<String> _sizes = [
    "Small",
    "Mediurm",
    "Large",
    "X-Large",
    "2xL",
    "XL",
    "4XL"
  ]; // Option 2
  String _selectedsize; // Option 2

  List<String> _Categories = [
    "Tops",
    "Shirts",
    "Shoes",
    "dresses",
    "Glasses",
    "Jeans",
    "Bags",
    "Make-ups"
  ]; // Option 2
  String _selectedCategory;
  String title;
  String descreption;
  String color;
  String salesPoint;
  String category ;
  String size ;
  String quantity;
  String price;
  _AddProduct() {
    _selectedsize = _sizes[0];
    _selectedCategory = _Categories[0];
  }

  @override
  Widget build(BuildContext context) {
    Firestore firebaseref = Firestore.instance;
    CollectionReference productRef = firebaseref.collection("Product");
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromRGBO(75, 142, 141, 30),
        title: new Text("Add Products"),
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          /*  Padding(
              padding: const EdgeInsets.all(10.0),
              child: new RaisedButton.icon(
                  color: Colors.red,
                  shape: new RoundedRectangleBorder(
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(15.0))),
                  onPressed: () => debugPrint("fgd;l"),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: new Text(
                    "Add Images from Gallery",
                    style: new TextStyle(color: Colors.white),
                  )),
            ),
          */
        ],
      ),
      body: new ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          new Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 15, top: 30, right: 0, bottom: 15.0),
                child: new Text(
                  "Add Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: " Enter Product title",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                     title = val;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: " Enter Product Description",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                    descreption = val;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: " Enter Product Price",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                    price = val;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: " Enter Product Color",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                    color = val;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: " Enter Product Quantity",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                    quantity = val;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 0, bottom: 15.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: " Enter Sales Point",
                    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  onChanged: (val) {
                    salesPoint = val;
                  },
                ),
              ),

                 //SizedBox(height: 220,),
              Padding(padding: EdgeInsets.only(top:10 ,right: 0,bottom:15.0 )),
                  DropdownButton<String>(
                    hint: Text('Choose Size',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 20)), // Not necessary for Option 1
                    value: _selectedsize,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.teal),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    items: _sizes.map((size) {
                      return DropdownMenuItem<String>(
                        child: new Text(size),
                        value: size,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedsize = newValue;
                      });
                    },
                  ),
              Padding(padding: EdgeInsets.only(top:10 ,right: 0,bottom:15.0 )),
                  DropdownButton<String>(
                    hint: Text('Choose Category',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 20)), // Not necessary for Option 1
                    value: _selectedCategory,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.teal),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,
                    ),
                    items: _Categories.map((category) {
                      return DropdownMenuItem<String>(
                        child: new Text(category),
                        value: category,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                  ),

//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: new RaisedButton.icon(
//                    color: Colors.green,
//                    shape: new RoundedRectangleBorder(
//                        borderRadius:
//                            new BorderRadius.all(new Radius.circular(15.0))),
//                    onPressed: null,
//                    icon: Icon(
//                      Icons.add,
//                      color: Colors.white,
//                    ),
//                    label: new Text(
//                      "Add Images from Gallery",
//                      style: new TextStyle(color: Colors.white),
//                    )),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(10.0),
//                child: new RaisedButton.icon(
//                    color: Colors.redAccent,
//                    shape: new RoundedRectangleBorder(
//                        borderRadius:
//                            new BorderRadius.all(new Radius.circular(15.0))),
//                    onPressed: null,
//                    icon: Icon(
//                      Icons.add,
//                      color: Colors.white,
//                    ),
//                    label: new Text(
//                      "Add Images from Camera",
//                      style: new TextStyle(color: Colors.white),
//                    )),
//              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: new RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Add Product',
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                  color: Colors.teal,
                  onPressed: () {
                    print(title);
                    print(descreption);
                    print(price);
                    print(color);
                    print(quantity);
                    print(salesPoint);
                    print(size);
                    print(category);
                    productRef.add({
                      "ProductName": title,
                      "Descreption": descreption,
                      "Price":price,
                      "Color": color,
                      "Quantity": quantity,
                      "Sales Point": salesPoint,
                      "Size": size,
                      "Category": category,
                    }).then((data) {
                      print("done");
                      // print(data);
                      Toast.show("Added Succesflly", context, duration: 1);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return HelloApp();
                      }));
                    }).catchError((err) {
                      print("Err");
                      Toast.show("Error :" + err, context, duration: 1);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
