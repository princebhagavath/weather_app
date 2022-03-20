// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/screens/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  var query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onChanged: ((value) {
                  query = value;
                }),
                controller: _controller,
              ),
            ),
            SizedBox(height: 42),
            FlatButton(
              onPressed: () {
                _controller.clear();
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(query: query);
                  },
                ));
              },
              color: Colors.blue[100],
              child: Text(
                'Search',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
