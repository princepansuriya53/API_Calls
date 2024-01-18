// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Show_data extends StatefulWidget {
  final albumId;
  final id;
  final title;
  final url;
  final thumbnailUrl;
  const Show_data(
      {Key? key,
      required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  @override
  State<Show_data> createState() => Show_dataState();
}

class Show_dataState extends State<Show_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Data'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(widget.albumId.toString(),
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 5),
              Image.network(widget.thumbnailUrl),
              const SizedBox(height: 5),
              Text(widget.title),
              const SizedBox(height: 5),
              Image.network(widget.url),
              Text(
                widget.id.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
