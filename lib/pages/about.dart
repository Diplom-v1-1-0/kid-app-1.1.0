import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Аппын тухай',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Хүүхдэд зориулсан сургалтын апп',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Version: 1.1.0',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Диплом',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Тайлбар:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Хүүхдүүддээ янз бүрийн зүйлийг сурах боломжийг олгох интерактив програм\n\n - A - Я хүртэл цагаан толгой.\n - Амьтадын дуу чимээ.\n - Шувуудийн дуу чимээ.\n - Төрөл бүрийн хэлбэр дүрс.\n - Гараг эрхэс.\n',
              style: TextStyle(fontSize: 18.0),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(context, 'https://kid-learning-apps.netlify.app/');
              },
              child: const Text(
                'Аппын Танилцуулга веб ',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    try {
      // ignore: deprecated_member_use
      await launch(url);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }
}
