import 'package:flutter/material.dart';

class SoilResult extends StatefulWidget {
  const SoilResult({
    super.key,
    required this.predictResult,
    required this.feelTest,
    required this.vinegarTest,
    required this.wormPresence,
    required this.organiMatter,
  });

  final double predictResult;
  final double feelTest;
  final double vinegarTest;
  final double wormPresence;
  final double organiMatter;

  @override
  State<SoilResult> createState() => _SoilResultState();
}

class _SoilResultState extends State<SoilResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
        leading: BackButton(onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text("Your prediction result is ${widget.predictResult}"),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------------organic matter------------------
class OrganicMatter extends StatefulWidget {
  const OrganicMatter({super.key});

  @override
  State<OrganicMatter> createState() => _OrganicMatterState();
}

class _OrganicMatterState extends State<OrganicMatter> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Looks like your soil has low organic matter"),
        SizedBox(
          height: 10,
        ),
        Text("Here Are some ways to improve it"),
        SizedBox(
          height: 10,
        ),
        Text("Adding Organic Materials:"),
        SizedBox(
          height: 10,
        ),
        Text(
            "Compost: This is a gardener's gold! Compost is decomposed organic matter teeming with beneficial microbes and nutrients. Regularly adding compost to your soil is an excellent way to boost organic matter content."
            "\n"
            "Mulch: Applying a layer of organic mulch (like shredded bark, wood chips, or leaves) around your plants helps retain moisture, suppress weeds, and gradually decomposes, adding organic matter to the soil over time."
            "\n"
            "Cover Crops: Planting cover crops during fallow periods is a fantastic strategy. These fast-growing plants are tilled back into the soil, adding organic matter and improving soil structure. Leguminous cover crops like clover also fix nitrogen in the soil, further enhancing its fertility."
            "\n"
            "Manure (optional): Manure from herbivores like cows, sheep, or horses can be a good source of organic matter. However, it's important to use aged manure to avoid burning plants or introducing weed seeds and pathogens.")
      ],
    );
  }
}
