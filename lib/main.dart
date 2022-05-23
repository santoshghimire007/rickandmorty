import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rick_morty_api/models/rick_morty_model.dart';
import 'package:rick_morty_api/services/rick_morty_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  List<RickMortyModel> rmList = [];

  fetchRMData() {
    RickMorty().fetchRickMortyData(pageNo).then((value) {
      setState(() {
        rmList = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchRMData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              itemCount: rmList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                RickMortyModel data = rmList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(data.image!),
                        )),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
