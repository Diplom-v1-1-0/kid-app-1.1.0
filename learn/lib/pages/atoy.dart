import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

class ItemTile extends StatelessWidget {
  final int index;
  final List<ItemData> items;
  final bool isTimerEnabled;

  const ItemTile({
    super.key,
    required this.index,
    required this.items,
    required this.isTimerEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final item = items[index];
    return Card(
      color: item.backgroundColor,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return _PopupContent(
                items: items,
                currentIndex: index,
                isAutoNextEnabled: isTimerEnabled,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 3),
              SvgPicture.asset(
                item.iconAsset,
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 3),
              Text(item.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupContent extends StatefulWidget {
  final List<ItemData> items;
  final int currentIndex;
  final bool isAutoNextEnabled;

  const _PopupContent({
    required this.items,
    required this.currentIndex,
    required this.isAutoNextEnabled,
  });

  @override
  _PopupContentState createState() => _PopupContentState();
}

class _PopupContentState extends State<_PopupContent> {
  late int currentIndex;
  Timer? timer;
  late bool isAutoNextEnabled;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;

    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        _nextItem();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.items[currentIndex];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          color: currentItem.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          currentItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      currentItem.iconAsset,
                      width: 200,
                      height: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _previousItem,
                        child: const Text('Өмнөх'),
                      ),
                      ElevatedButton(
                        onPressed: _nextItem,
                        child: const Text('Дараах'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(216, 233, 101, 92)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Хаах',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemData {
  final String iconAsset;
  final String title;
  final String description;
  // final String soundAsset;
  final Color backgroundColor;

  ItemData({
    required this.iconAsset,
    required this.title,
    required this.description,
    // this.soundAsset
    required this.backgroundColor,
  });
}

class atoy extends StatefulWidget {
  const atoy({Key? key}) : super(key: key);

  @override
  State<atoy> createState() => _atoyState();
}

class _atoyState extends State<atoy> {
  bool isTimerEnabled = false;

  List<ItemData> items = [
    ItemData(
      iconAsset: 'assets/images/apple.svg',
      title: 'А',
      description: 'Алим',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: 'assets/images/ball.svg',
      title: 'Б',
      description: 'Бөмбөг',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/vase.svg',
      title: 'В',
      description: 'Ваар',
      backgroundColor: const Color.fromARGB(120, 100, 150, 50),
    ),
    ItemData(
      iconAsset: 'assets/images/pig.svg',
      title: 'Г',
      description: 'Гахай',
      backgroundColor: const Color.fromARGB(120, 238, 0, 255),
    ),
    ItemData(
      iconAsset: 'assets/images/kettle.svg',
      title: 'Д',
      description: 'Данх',
      backgroundColor: const Color.fromARGB(120, 164, 212, 246),
    ),
    ItemData(
      iconAsset: 'assets/images/egypt.svg',
      title: 'Е',
      description: 'Египт',
      backgroundColor: const Color.fromARGB(120, 232, 190, 0),
    ),
    ItemData(
      iconAsset: 'assets/images/europe.svg',
      title: 'Ё',
      description: 'Ёвроп',
      backgroundColor: const Color.fromARGB(120, 44, 75, 97),
    ),
    ItemData(
      iconAsset: 'assets/images/fruits.svg',
      title: 'Ж',
      description: 'Жимс',
      backgroundColor: const Color.fromARGB(120, 221, 222, 115),
    ),
    ItemData(
      iconAsset: 'assets/images/elephant.svg',
      title: 'З',
      description: 'Заан',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(115, 66, 173, 127),
    ),
    ItemData(
      iconAsset: 'assets/images/irish.svg',
      title: 'И',
      description: 'Ирланд',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 20, 255, 145),
    ),
    ItemData(
      iconAsset: 'assets/images/pc.svg',
      title: 'К',
      description: 'Компьютер',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 96, 58, 230),
    ),
    ItemData(
      iconAsset: 'assets/images/candless.svg',
      title: 'Л',
      description: 'Лаа',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 227, 106, 0),
    ),
    ItemData(
      iconAsset: 'assets/images/cat.svg',
      title: 'М',
      description: 'Муур',
      backgroundColor: const Color.fromARGB(194, 130, 243, 69),
    ),
    ItemData(
      iconAsset: 'assets/images/dog.svg',
      title: 'Н',
      description: 'Нохой',
      backgroundColor: const Color.fromARGB(115, 215, 199, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/tree.svg',
      title: 'О',
      description: 'Ой',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 147, 226, 184),
    ),
    ItemData(
      iconAsset: 'assets/images/pants.svg',
      title: 'Ө',
      description: 'Өмд',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 233, 195, 161),
    ),
    ItemData(
      iconAsset: 'assets/images/xerox.svg',
      title: 'П',
      backgroundColor: const Color.fromARGB(115, 0, 236, 71),
      description: 'Принтер',
    ),
    ItemData(
      iconAsset: 'assets/images/radio.svg',
      title: 'Р',
      description: 'Радио',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 61, 50, 40),
    ),
    ItemData(
      iconAsset: 'assets/images/moon.svg',
      title: 'С',
      description: 'Сар',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 134, 57, 217),
    ),
    ItemData(
      iconAsset: 'assets/images/parrot.svg',
      title: 'Т',
      backgroundColor: const Color.fromARGB(115, 120, 118, 215),
      description: 'Тоть',
    ),
    ItemData(
      iconAsset: 'assets/images/grapes.svg',
      title: 'У',
      backgroundColor: const Color.fromARGB(115, 215, 118, 175),
      description: 'Усан үзэм',
    ),
    ItemData(
      iconAsset: 'assets/images/nest.svg',
      title: 'Ү',
      description: 'Үүр',
      backgroundColor: const Color.fromARGB(115, 118, 215, 121),
    ),
    ItemData(
      iconAsset: 'assets/images/flash.svg',
      title: 'Ф',
      description: 'Флаш',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 224, 212, 237),
    ),
    ItemData(
      iconAsset: 'assets/images/king.svg',
      title: 'Х',
      backgroundColor: const Color.fromARGB(115, 171, 215, 118),
      description: 'Хаан',
    ),
    ItemData(
      iconAsset: 'assets/images/window.svg',
      title: 'Ц',
      backgroundColor: const Color.fromARGB(246, 255, 194, 25),
      description: 'Цонх',
    ),
    ItemData(
      iconAsset: 'assets/images/sledge.svg',
      title: 'Ч',
      description: 'Чарга',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 221, 142, 52),
    ),
    ItemData(
      iconAsset: 'assets/images/table.svg',
      title: 'Ш',
      backgroundColor: const Color.fromARGB(180, 138, 64, 228),
      description: 'Ширээ',
    ),
    ItemData(
      iconAsset: 'assets/images/soup.svg',
      title: 'Щ',
      description: 'Борщ',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(120, 234, 172, 101),
    ),
    ItemData(
      iconAsset: 'assets/images/spreads.svg',
      title: 'Ъ',
      description: 'Таръя',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(249, 43, 228, 23),
    ),
    ItemData(
      iconAsset: 'assets/images/horse.svg',
      title: 'Ь',
      description: 'Морь',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 233, 145, 46),
    ),
    ItemData(
      iconAsset: 'assets/images/elephant.svg',
      title: 'Ы',
      description: 'Зааны тугал',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 103, 248, 185),
    ),
    ItemData(
      iconAsset: 'assets/images/butterfly.svg',
      title: 'Э',
      description: 'Эрвээхэй',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 238, 0, 255),
    ),
    ItemData(
      iconAsset: 'assets/images/hoodie.svg',
      title: 'Ю',
      description: 'Юүдэнтэй цамц',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 255, 114, 114),
    ),
    ItemData(
      iconAsset: 'assets/images/deer.svg',
      title: 'Я',
      description: 'Янзага',
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 253, 200, 23),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'А-Я',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isTimerEnabled
                        ? MaterialStateProperty.all(Colors.green)
                        : MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      isTimerEnabled = !isTimerEnabled;
                    });
                  },
                  child: const Text(
                    'Auto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (int i = 0; i < items.length; i++)
              ItemTile(
                index: i,
                items: items,
                isTimerEnabled: isTimerEnabled,
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const atoy());
}
