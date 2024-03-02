// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class Bird {
  final String name;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Bird({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}

class BirdsPage extends StatelessWidget {
  final List<Bird> birds = [
    Bird(
      name: 'бор шувуу',
      svgAsset: 'assets/birds/Sparrow.svg',
      soundAsset: 'assets/birds/Sparrow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Хэрээ',
      svgAsset: 'assets/birds/Crow.svg',
      soundAsset: 'assets/birds/Crow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Bird(
      name: 'цахлай',
      svgAsset: 'assets/birds/Seagull.svg',
      soundAsset: 'assets/birds/Seagull.mp3',
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Bird(
      name: 'нугас',
      svgAsset: 'assets/birds/Duck.svg',
      soundAsset: 'assets/birds/Duck.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Bird(
      name: 'тахиа',
      svgAsset: 'assets/birds/Hen.svg',
      soundAsset: 'assets/birds/Hen.mp3',
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Bird(
      name: 'бүргэд',
      svgAsset: 'assets/birds/Eagle.svg',
      soundAsset: 'assets/birds/Eagle.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Bird(
      name: 'шар шувуу',
      svgAsset: 'assets/birds/Owl.svg',
      soundAsset: 'assets/birds/Owl.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'хулин шувуу',
      svgAsset: 'assets/birds/Hummingbird.svg',
      soundAsset: 'assets/birds/Hummingbird.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Bird(
      name: 'тоть',
      svgAsset: 'assets/birds/Parrot.svg',
      soundAsset: 'assets/birds/Parrot.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Bird(
      name: 'хун',
      svgAsset: 'assets/birds/Swan.svg',
      soundAsset: 'assets/birds/Swan.mp3',
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Bird(
      name: 'Галуу',
      svgAsset: 'assets/birds/Goose.svg',
      soundAsset: 'assets/birds/Goose.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Bird(
      name: 'Тоншуул',
      svgAsset: 'assets/birds/Woodpecker.svg',
      soundAsset: 'assets/birds/Woodpecker.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Bird(
      name: 'Тэмээн хяруул',
      svgAsset: 'assets/birds/Ostrich.svg',
      soundAsset: 'assets/birds/Ostrich.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Bird(
      name: 'тас шувуу',
      svgAsset: 'assets/birds/Vulture.svg',
      soundAsset: 'assets/birds/Vulture.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();
  BirdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birds',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BirdWidget(
          birds: birds,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}

class BirdWidget extends StatefulWidget {
  final List<Bird> birds;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;

  BirdWidget({
    required this.birds,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  _BirdWidgetState createState() => _BirdWidgetState();
}

class _BirdWidgetState extends State<BirdWidget> {
  int currentIndex = 0;

  void _navigateToNextBird() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.birds.length;
    });
  }

  void _navigateToPreviousBird() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + widget.birds.length) % widget.birds.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Bird bird = widget.birds[currentIndex];
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _navigateToNextBird,
            child: Container(
              width: 375,
              height: 375,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
                color: bird.backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 350,
                    child: SvgPicture.asset(bird.svgAsset),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _navigateToPreviousBird,
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _playBirdSound(bird.soundAsset);
                },
                child: const Text('Дуу сонсох'),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: _navigateToNextBird,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _playBirdSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }
}
