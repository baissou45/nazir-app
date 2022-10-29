import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nazir_app/pages/gestes_barriere.dart';
import 'package:nazir_app/pages/presentation.dart';
import 'package:nazir_app/pages/sympthomes.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    List<int> list = [1, 2, 3, 4, 5];

    box_card(image, text, page) {
      return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: largeur / 2.4,
              height: longeur / 4.5,
              color: Colors.indigo,
              child: Image.asset(
                image,
                color: Colors.black.withOpacity(0.55),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: largeur / 2.4,
            height: longeur / 4.5,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: largeur / 20,
                  // fontWeight: FontWeight.bold,
                  // fontFamily: 'Bitter',
                ),
              ),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: longeur / 50.0, left: largeur / 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("Tous anti covid",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: largeur / 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeur / 50.0),
                  child: Container(
                    color: Colors.white,
                    child: TextFormField(
                        validator: (value) {},
                        // controller: _passwordTextController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.indigo,
                          ),
                          border: OutlineInputBorder(),
                        )),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(height: longeur / 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                box_card(
                                    'assets/images/02.png',
                                    'Le covid \nc\'est quoi ?',
                                    const Presentation()),
                                box_card('assets/images/04.png',
                                    'Les \nsympthomes', const Symptomes()),
                              ],
                            ),
                            SizedBox(height: longeur / 50.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                box_card(
                                    'assets/images/01.png',
                                    'Les gestes barrières',
                                    const GestesBarrieres()),
                                box_card(
                                    'assets/images/03.png',
                                    'Que faire en \ncas de contamination ?',
                                    Presentation()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: largeur,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              // disableCenter: true,
                              autoPlay: true,
                            ),
                            items: list
                                .map((item) => Container(
                                      margin: EdgeInsets.only(
                                          left: largeur / 80.0,
                                          right: largeur / 80.0,
                                          bottom: longeur / 80.0),
                                      decoration: BoxDecoration(
                                          color: Colors.indigo[50],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      width: largeur,
                                      child: Row(children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: largeur / 30.0),
                                          child: Image.asset(
                                            'assets/images/oms.png',
                                            colorBlendMode: BlendMode.darken,
                                            width: largeur / 5,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Titre de l'annonce",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: longeur / 80.0,
                                              ),
                                              Text(
                                                "data  sbhvuf sfjnu idata sbhvufsfj nuidata sbh vuf sfjnu idata sbh vufsfj ...",
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
