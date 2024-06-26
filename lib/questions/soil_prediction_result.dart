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
        child: SingleChildScrollView(
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
                      const SizedBox(height: 20),
                      OrganicMatter(showWidget: widget.organiMatter < 0.3),
                      WormPresence(isWormPresent: widget.wormPresence==0),
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

//-------------------------organic matter------------------
class OrganicMatter extends StatefulWidget {
  const OrganicMatter({super.key, required this.showWidget});

  final bool showWidget;

  @override
  State<OrganicMatter> createState() => _OrganicMatterState();
}

class _OrganicMatterState extends State<OrganicMatter> {
  @override
  Widget build(BuildContext context) {
    return widget.showWidget
        ? const Column(
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
          )
        : const Text("Your orgeanic matter content is high");
  }
}

//----------------------------worm presence------------------

class WormPresence extends StatefulWidget {
  const WormPresence({super.key, required this.isWormPresent});

  final bool isWormPresent;

  @override
  State<WormPresence> createState() => _WormPresenceState();
}

class _WormPresenceState extends State<WormPresence> {
  @override
  Widget build(BuildContext context) {
    return widget.isWormPresent
        ? const Column(
            children: [
              Text("Looks like your soil has less worm presence"),
              SizedBox(
                height: 10,
              ),
              Text("Here Are some ways to improve it"),
              SizedBox(
                height: 10,
              ),
              Text("Create a Worm-Friendly Habitat"),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Moisture is key: Earthworms are about 80% water, so consistent moisture is crucial. Water your soil regularly, but avoid waterlogging, which can drown them"
                  "\n"
                  "Organic buffet: Worms feed on decomposing organic matter. Regularly add compost, shredded leaves, or other organic materials to your soil. This food source will attract and sustain them."
                  "\n"
                  "Minimize tilling: Excessive tilling disrupts worm burrows and destroys their habitat. Consider no-till or reduced tillage practices to create a stable environment for them."
                  "\n"
                  "Mulch matters: Apply a layer of organic mulch (like shredded bark, wood chips, or leaves) around your plants. This helps retain moisture, keeps the soil cool, and provides a food source for worms as it decomposes.")
            ],
          )
        : const Text("Worm presence is good");
  }
}
