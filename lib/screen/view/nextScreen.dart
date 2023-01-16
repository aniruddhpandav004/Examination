import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reexamination1/screen/model/postModel.dart';
import 'package:reexamination1/screen/provider/homeProvider.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("APiData"),
        ),
        drawer: Drawer(),
        body: FutureBuilder<PostModel>(
          future: Provider.of<HomeProvider>(context,listen: false).apicalling(title),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              PostModel postModel = snapshot.data!;
              return ListView.builder(
                itemCount: postModel.articles!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 450,
                    width: 100,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          child: Image.network(
                              "${postModel.articles![index].urlToImage}"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${postModel.articles![index].title}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("${postModel.articles![index].description}"),
                        Text("${postModel.articles![index].publishedAt}",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
