import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ios/Api.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true), home: homepage(), title: "Apps");
  }
}

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(80)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    "Hy user",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Good Morning',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    foregroundColor: Color.fromARGB(255, 59, 51, 51),
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/user/c_v_r/1900x800'),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  itamDashBoard("Add Post", CupertinoIcons.add, Colors.red),
                  itamDashBoard(
                      "Upload", CupertinoIcons.upload_circle, Colors.blue),
                  itamDashBoard(
                      "Setting", CupertinoIcons.settings, Colors.black),
                  itamDashBoard("Refresh",
                      CupertinoIcons.arrow_counterclockwise, Colors.green),
                  itamDashBoard("Data", CupertinoIcons.calendar_circle,
                      Colors.deepPurple),
                  itamDashBoard(
                      "Updates",
                      CupertinoIcons.arrow_up_arrow_down_circle_fill,
                      Colors.grey),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itamDashBoard(String title, IconData icon, Color backgroudcolor) => Container(
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                blurRadius: 8,
                spreadRadius: 1)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: backgroudcolor, shape: BoxShape.circle),
              child: IconButton(
                autofocus: true,
                icon: Icon(icon),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => apis()));
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
}
