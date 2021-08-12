import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List listResponse = [];
  Future fetchData() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://api.sampleapis.com/futurama/characters"));
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  bool isVisible = false;
  bool isLoading = true;

  void showToast() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  String url =
      "https://images.unsplash.com/photo-1526470608268-f674ce90ebd4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News App"),
          leading: Icon(Icons.feed),
        ),
        body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Text(
                    "News Topics",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height:
                      isVisible ? MediaQuery.of(context).size.height * 3 : 400,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: listResponse.length,
                      itemBuilder: (BuildContext context, int i) =>
                          GestureDetector(
                            onTap: () {
                              showToast();
                            },
                            child: Card(
                              color: Colors.blueAccent,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        children: [
                                          Text(
                                            "Name:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            listResponse[i]["name"]["first"],
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                    Wrap(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: Text(
                                              "Age:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Text(
                                            listResponse[i]["age"],
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                    Wrap(
                                        spacing: 10,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        direction: Axis.horizontal,
                                        children: [
                                          Text(
                                            "Occupation:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            listResponse[i]["occupation"],
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      child: Container(
                                        height: 200,
                                        child: Image.network(
                                            listResponse[i]["images"]["main"]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      child: Center(
                                        child: Text(
                                          "Story",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isVisible,
                                      child: getTextWidgets(
                                          listResponse[i]["sayings"]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
                Text(
                  "Tap on the Article to read more!!",
                  style: TextStyle(color: Colors.black),
                )
              ]),
            ),
          )),
        ));
  }
}

Widget getTextWidgets(List<dynamic> strings) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < strings.length; i++) {
    list.add(new Text(strings[i]));
  }
  return new Column(children: list);
}
