import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Le covid c'est quoi ?"),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/presentation.jpg"),
          SizedBox(height: longeur / 50.0),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: largeur / 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Qu’est-ce qu’un « nouveau » coronavirus ?",
                      style: TextStyle(
                        fontFamily: "Anton",
                      ),
                    ),
                    SizedBox(height: longeur / 50.0),
                    const Text(
                      "Covid-19 fait référence à « Coronavirus Disease 2019 », la maladie provoquée par un virus de la famille des Coronaviridae, le SARS-CoV-2. Cette maladie infectieuse est une zoonose, dont l'origine est encore débattue, qui a émergé en décembre 2019 dans la ville de Wuhan, dans la province du Hubei en Chine. Elle s'est rapidement propagée, d'abord dans toute la Chine, puis à l'étranger provoquant une épidémie mondiale.",
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: longeur / 80.0),
                    const Text(
                      "Le Covid-19 est une maladie respiratoire pouvant être mortelle chez les patients fragilisés par l'âge ou une autre maladie chronique. Elle se transmet par contact rapproché avec des personnes infectées. La maladie pourrait aussi être transmise par des patients asymptomatiques mais les données scientifiques manquent pour en attester avec certitude.",
                      textAlign: TextAlign.justify,
                    ),
                  ]),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: longeur / 100.0, top: longeur / 100.0),
            child: InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://www.futura-sciences.com/sante/definitions/coronavirus-covid-19-18585/"));
                },
                child: const Text(
                  "Provenance : futura-sciences.com",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                )),
          )
        ],
      ),
    );
  }
}
