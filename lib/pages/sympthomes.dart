import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class Symptomes extends StatelessWidget {
  const Symptomes({super.key});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    List<String> symptomes = [
      "une fièvre (dans 88 % des cas selon l'OMS),",
      "des maux de tête (14 %), une toux sèche (68 % des cas),",
      "une fatigue (38 %), des douleurs musculaires (15 %), des frissons (11 %),",
      "une irritation de la gorge (14 %)."
    ];

    List<String> symptomes_accompagner = [
      "d'expectorations (33 %),",
      "d'un essoufflement (19 %),",
      "de nausées et/ou de vomissements (5 %),",
      "d'une congestion nasale (5 %),",
      "de diarrhées (4 %)."
    ];

    List<String> symptomes_moin_freq = [
      "une perte de l'odorat et du goût,",
      "des éruptions cutanées (de type engelure sur les doigts ou les orteils),",
      "une conjonctivite."
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Symptômes'),
      ),
      body: Column(children: [
        Image.asset("assets/images/symptomes.jpg"),
        SizedBox(height: longeur / 50.0),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: largeur / 50.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                      "L'essentiel à savoir sur les symptômes du coronavirus"),
                  SizedBox(height: longeur / 50.0),
                  SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: longeur / 50.0),
                            child: const Text(
                              "Dans sa forme typique, l'infection à coronavirus peut être confondue avec une grippe saisonnière, car elle entraîne également :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          for (var symp in symptomes)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: largeur / 50.0),
                              child: Text('- $symp'),
                            ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: longeur / 50.0),
                            child: const Text(
                              "L'infection à coronavirus peut aussi s'accompagner :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          for (var symp in symptomes_accompagner)
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: largeur / 50.0),
                                child: Text('- $symp')),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: longeur / 50.0),
                            child: const Text(
                              "Moins fréquemment, la maladie Covid-19 peut entraîner :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          for (var symp in symptomes_moin_freq) Text('- $symp')
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: longeur / 100.0, top: longeur / 100.0),
          child: InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    "https://www.passeportsante.net/fr/Maux/Problemes/Fiche.aspx?doc=coronavirus-covid-19-symptomes-du-coronavirus"));
              },
              child: const Text(
                "Provenance : passeportsante.net",
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              )),
        )
      ]),
    );
  }
}
