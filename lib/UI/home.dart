import 'package:opdracht_twee/CatFact.dart';
import 'package:opdracht_twee/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opdracht_twee/Util/api_service.dart';

import 'dart:async';
import 'dart:convert';

class CatInfo extends StatefulWidget {
  const CatInfo({Key? key}) : super(key: key);

  @override
  State<CatInfo> createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {
  CatFact? _catFact;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _catFact = (await ApiService().getUsers());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('REST API Example'),
        ),
        body: _catFact == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _catFact!.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        Text(_catFact!.data![index].fact.toString()),
                      ]));
                }));
  }
}
