import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './models/users_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> users = [];
  @override
  void initState() {
    _retrieveUsers();
    super.initState();
  }

  _retrieveUsers() async {
    users = [];
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = json.decode((await http.get(url)).body);

    response.forEach((element) {
      users.add(Users.fromJson(element));
    });
    setState(() {});
    print("-->$response");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _retrieveUsers();
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.grey[700],
                  ),
                  // SizedBox(width: 2),
                  Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 110,
                    ),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.orange[700],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  style: TextStyle(
                    height: 1,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: users == null
                            ? 0
                            : (users.length > 5 ? 5 : users.length),
                        itemBuilder: (BuildContext context, int i) {
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              leading: Text(
                                "${users[i].id}.",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              title: Text(
                                "${users[i].username}",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
