import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SoilQuality extends StatefulWidget {
  const SoilQuality({super.key});

  @override
  State<SoilQuality> createState() => _SoilQualityState();
}

class _SoilQualityState extends State<SoilQuality> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soil Quality"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => const SoilPredictionScreen(),
          );
        },
        child: const Text("Check soil quality"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Feel Test",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "The feel test is a simple and quick way to get a general idea of your soil texture, which is the proportion of sand, silt, and clay particles in the soil.",
              ),
              SizedBox(height: 20),
              Text(
                "Steps To do feel test",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              FeelTestCard(),
              SizedBox(height: 20),
              Text(
                "Vinegar Test",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "A bunch of bubbles in the vinegar test means your soil is more likely on the alkaline side (pH above 7).",
              ),
              SizedBox(height: 20),
              Text(
                "Amending alkaline soil",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "There are several ways to amend your soil to make it more acidic. Some common amendments include",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              AmendingSoil(),
            ],
          ),
        ),
      ),
    );
  }
}
//---------------------------model bottom sheet----------------------------------------------

class SoilPredictionScreen extends StatefulWidget {
  const SoilPredictionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SoilPredictionScreenState createState() => _SoilPredictionScreenState();
}

class _SoilPredictionScreenState extends State<SoilPredictionScreen> {
  // Define variables to store input values
  double _feel = 1.0;
  double _vinegarTest = 1.0;
  double _wormPresence = 0.0;
  double _organicMatter = 0.0;
  String prediction = '';

  // String _feeloption = "0";
  // String _vinegarTestOption = "more bubble";
  // String _wormPresenceOption = "yes";
  // String _organicMatterOption = "High";

  // Initialize TensorFlow Lite interpreter
  late Interpreter interpreter;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset('assets/model.tflite');
  }

  // Function to perform prediction
  void predict() {
    // Prepare input data
    var input = [_feel, _vinegarTest, _wormPresence, _organicMatter];
    var inputBuffer = Float32List.fromList(input).buffer;

    // Perform inference
    var outputBuffer = Float32List(1).buffer;
    interpreter.run(inputBuffer, outputBuffer);

    // Get the prediction
    var predictedValue = outputBuffer.asFloat32List()[0];

    setState(() {
      prediction = 'Predicted Class: $predictedValue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Input fields for values
              Row(
                children: [
                  const Text("Feel Test"),
                  const SizedBox(width: 20),
                  DropdownButton<double>(
                    value: _feel,
                    onChanged: (double? newValue) {
                      setState(() {
                        _feel = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 1.0,
                        child: Text("one"),
                      ),
                      DropdownMenuItem(
                        value: 2.0,
                        child: Text("two"),
                      ),
                      DropdownMenuItem(
                        value: 3.0,
                        child: Text("three"),
                      ),
                      DropdownMenuItem(
                        value: 4.0,
                        child: Text("four"),
                      ),
                      DropdownMenuItem(
                        value: 5.0,
                        child: Text("five"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Vinegar Test"),
                  const SizedBox(width: 20),
                  DropdownButton<double>(
                    value: _vinegarTest,
                    onChanged: (double? newValue) {
                      setState(() {
                        _vinegarTest = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 1.0,
                        child: Text("no bubble"),
                      ),
                      DropdownMenuItem(
                        value: 2.0,
                        child: Text("bubble"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("worm presence"),
                  const SizedBox(width: 20),
                  DropdownButton<double>(
                    value: _wormPresence,
                    onChanged: (double? newValue) {
                      setState(() {
                        _wormPresence = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 0.0,
                        child: Text("no"),
                      ),
                      DropdownMenuItem(
                        value: 1.0,
                        child: Text("yes"),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Organic Matter"),
                  const SizedBox(width: 20),
                  DropdownButton<double>(
                    value: _organicMatter,
                    onChanged: (double? newValue) {
                      setState(() {
                        _organicMatter = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 0.0,
                        child: Text("low"),
                      ),
                      DropdownMenuItem(
                        value: 1.0,
                        child: Text("medium"),
                      ),
                      DropdownMenuItem(
                        value: 2.0,
                        child: Text("high"),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Button to perform prediction
              ElevatedButton(
                onPressed: predict,
                child: const Text('Predict'),
              ),
              // Display prediction result
              Text(prediction),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    interpreter.close();
    super.dispose();
  }
}

//---------------------------------feel test cards----------------------
class FeelTestCard extends StatefulWidget {
  const FeelTestCard({super.key});

  @override
  State<FeelTestCard> createState() => _FeelTestCardState();
}

List feelTestSteps = [
  [
    "Gather your soil",
    "Take a small sample of soil from your garden bed or potting mix. Ideally, collect it from a few different spots to get a representative sample from the area you're interested in.",
  ],
  [
    "Moisten the soil",
    "Add a small amount of water to the soil and mix it gently. You want the soil to be slightly damp but not soggy.  Imagine the consistency of moist potting soil.",
  ],
  [
    "Feel the texture",
    "Rub a small amount of the moistened soil between your thumb and forefinger. Pay attention to the following:",
  ],
];

class _FeelTestCardState extends State<FeelTestCard> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: feelTestSteps
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

//--------------------amending soil------------
class AmendingSoil extends StatefulWidget {
  const AmendingSoil({super.key});

  @override
  State<AmendingSoil> createState() => _AmendingSoilState();
}

class _AmendingSoilState extends State<AmendingSoil> {
  List amendingCard = [
    [
      "Sulfur",
      "This is a natural soil amendment that breaks down over time, lowering the pH.",
    ],
    [
      "Peat moss",
      "Peat moss is acidic and can help to lower the pH of your soil. However, it can also restrict drainage, so use it sparingly.",
    ],
    [
      "Coffee grounds",
      "Used coffee grounds are slightly acidic and can be a good option for amending container soil.",
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: feelTestSteps
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
