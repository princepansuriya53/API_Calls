// ignore_for_file: file_names
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ios/jason.dart';
import 'dart:convert';

import 'package:ios/show_data.dart';

class apis extends StatefulWidget {
  const apis({super.key});

  @override
  State<apis> createState() => _apisState();
}

class _apisState extends State<apis> {
  List<data> _listdata = [];
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Future<void> fetchdata() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      setState(() {
        _listdata = json.map((item) => data.fromJson(item)).toList();
      });
    } else {
      throw Exception("Faild to load data");
    }
  }

  bool islode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data_APi'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        itemCount: _listdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Show_data(
                        albumId: _listdata[index].albumId,
                        id: _listdata[index].id,
                        thumbnailUrl: _listdata[index].thumbnailUrl,
                        title: _listdata[index].title,
                        url: _listdata[index].url,
                      ),
                    ));
              },
              contentPadding: const EdgeInsets.all(5),
              title: Text(_listdata[index].title.toString()),
              subtitle: Text(_listdata[index].albumId.toString()),
              leading: Image.network(_listdata[index].url.toString()),
              trailing: Image.network(_listdata[index].thumbnailUrl.toString()),
              visualDensity: VisualDensity.comfortable,
            ),
          );
        },
      ),
    );
  }
}
