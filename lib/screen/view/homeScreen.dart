import 'package:flutter/material.dart';
import 'package:reexamination1/screen/model/homeModel.dart';
import 'package:reexamination1/utils/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    DbHelper db = DbHelper();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Apicall"),
        ),
        drawer: Drawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  db.readData();
                },
                child: Text("Read"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  db.insertData(t1, d1, c1, p1, im1);
                },
                child: Text("SQL"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'next');
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
