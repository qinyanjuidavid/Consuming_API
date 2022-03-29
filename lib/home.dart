import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    color: Colors.grey[700],
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
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                        color: Colors.blue,
                        child: ListTile(
                          
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
