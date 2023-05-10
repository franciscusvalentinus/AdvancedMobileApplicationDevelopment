import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color favcolor;
  int favvalue;
  final ctrlNama = TextEditingController();

  @override
  void initState() {
    super.initState();
    favcolor = Colors.red;
    favvalue = 0;
  }

  @override
  void dispose() {
    ctrlNama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: Stack( children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: ctrlNama,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
                validator: (String value){
                  return value.contains('#') ? 'Do not use # in Email' : null;
                },
              ),
              RaisedButton.icon(
                onPressed: (){
                  // var ok;
                  // ctrlNama.text == "" ?
                  //   ok = "1"
                  // :
                  //   ok = "0";

                  if(ctrlNama.text == "") {
                    Fluttertoast.showToast(
                      msg: "Semua form harus diisi!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      fontSize: 16
                    );
                  }else {
                    Fluttertoast.showToast(
                        msg: "Semua form harus diisi!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        fontSize: 16
                    );
                  }
                },
                icon: Icon(Icons.upload_file),
                label: Text("Submit"),
              ),
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    if(favcolor == Colors.white){
                      favcolor = Colors.red;
                    }else{
                      favcolor = Colors.white;
                    }
                  });
                },
                child: Icon(
                  Icons.favorite, color: favcolor,
                ),
              ),
            ],
          ),
        ),
      ],),
    );
  }
}