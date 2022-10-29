import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GestesBarrieres extends StatelessWidget {
  const GestesBarrieres({super.key});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestes Barrieres"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/image.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: longeur / 100.0, top: longeur / 100.0),
            child: InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://www.gouv.bj/upload/images/articles/ckeditor/image(5).png"));
                },
                child: const Text(
                  "Provenance : gouv.bj",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                )),
          )
        ],
      ),
    );
  }
}
