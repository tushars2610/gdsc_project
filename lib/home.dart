import 'package:flutter/material.dart';
import 'package:gdsc_app/questions/soil_prediction.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: [
              ListTile(
                title: const Text("Soil Qualiity"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SoilQuality(),
                      ));
                },
              ),
              ListTile(
                title: const Text("second"),
                onTap: () {
                },
              ),
              ListTile(
                title: const Text("Third"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
