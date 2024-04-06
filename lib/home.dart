import 'package:flutter/material.dart';
import 'package:gdsc_app/questions/soil_prediction.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("second"),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Third"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Types of Farming"),
              SizedBox(
                height: 20,
              ),
              TypesOfFarming(),
            ],
          ),
        ),
      ),
    );
  }
}

//------------------------------------types of farming-----------------
class TypesOfFarming extends StatefulWidget {
  const TypesOfFarming({super.key});

  @override
  State<TypesOfFarming> createState() => _TypesOfFarmingState();
}

List farmingTypes = [
  [
    "Commercial farming",
    "This type of farming is focused on producing food for sale. Commercial farms are typically larger than subsistence farms and use more advanced technologies.",
  ],
  [
    "Mixed farming",
    "This type of farming combines crop production with livestock raising. Mixed farms can benefit from the synergies between these two activities. For example, crops can provide feed for livestock, and manure from livestock can be used to fertilize crops.",
  ],
  [
    "Monoculture farming",
    "This type of farming involves growing a single crop on a large area of land. Monoculture farming can be very efficient, but it can also be risky, as pests and diseases can easily spread through a monoculture crop.",
  ],
  [
    "Organic farming",
    "This type of farming avoids the use of synthetic pesticides and fertilizers. Organic farms rely on natural methods to control pests and diseases and to improve soil fertility.",
  ],
  [
    "Aquaculture",
    "This type of farming involves raising fish, shellfish, and other aquatic plants and animals. Aquaculture is becoming increasingly important as a source of food, as the oceans become depleted of wild fish.",
  ],
  [
    "Vertical farming:",
    "This type of farming involves growing crops in vertically stacked layers. Vertical farms can be located in urban areas, where there is little land available for traditional farming.",
  ],
  [
    "Precision farming",
    " This type of farming uses technology to collect data about crops and soil conditions. This data can then be used to make more informed decisions about planting, irrigation, and fertilization.",
  ],
  [
    "Aeroponic farming",
    "it is a high-tech way of growing plants without soil. Imagine misting plant roots with nutrients instead of planting them in dirt. That's the basic idea! It's a type of soilless farming that offers efficient nutrient delivery and faster growth.",
  ],
  [
    "Drip farming",
    "Drip irrigation, also known as trickle irrigation, is a water-saving method that delivers water directly to the roots of plants through a network of valves, pipes, tubing, and emitters.",
  ],
];

class _TypesOfFarmingState extends State<TypesOfFarming> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: farmingTypes
          .map(
            (item) => Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(
                      item[0],
                    ),
                    Text(
                      item[1],
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        autoPlay: false,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
        animateToClosest: true,
        height: 170,
      ),
    );
  }
}
