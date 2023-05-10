import 'package:amadweek3/font.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var iconColor = Colors.grey.shade800;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Aespa"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0XFF34495e), Color(0XFF2c3e50)]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black,
                        child: Image(
                          image: AssetImage("assets/images/aespa.jpg"),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/giselle.jpg")),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/karina.jpg")),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/ningning.jpg")),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/winter.jpg")),
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Aespa",
                        style: mainHeader,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    "Aespa (Korean: 에스파; RR: eseupa; MR: esŭp'a, commonly stylized in all lowercase or æspa) is a South Korean girl group formed by SM Entertainment. The group consists of Karina, Giselle, Winter and Ningning. The group debuted on November 17, 2020 with the release of their debut single, Black Mamba.[1][2]", style: subHeader),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    "On October 26, SM Entertainment announced that it would be debuting a new girl group, the first since Red Velvet in 2014[6] and the first overall idol group since NCT in 2016. The members were revealed individually from October 27 to 30 (in order: Winter, Karina, Ningning, and Giselle) as well as the name Aespa.[7] SM Entertainment founder Lee Soo-man further explained about Aespa's concept in the 2020 World Cultural Industry Forum that was held online on October 28.[8] A video trailer with all four members was revealed on November 2.[9] On the same day, the agency announced that Aespa will release their debut single Black Mamba on November 17.[10] The group made their broadcast debut on KBS2's Music Bank on November 20 where they performed their debut single.[11] The group also reached number one on the K-pop music video charts of China's biggest music-streaming service, QQ Music for three consecutive weeks.[12] On January 17, 2021, Aespa received their first ever music show win for their debut single on Inkigayo.[13]", style: subHeader),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: RichText(
                            text: TextSpan(
                                text:
                                    "On January 29, 2021, SM Entertainment announced Aespa will release a new single titled Forever, a remake of a single by Yoo Young-jin, released for SM Entertainment's holiday album Winter Vacation in SMTOWN.com in 2000.[14] The single was officially released on February 5, 2021.[15] The song has been described as a mid-tempo ballad with an acoustic guitar sound and warm lyrics about promising forever to a loved one.[16]", style: subHeader),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.95, -0.9),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (iconColor == Colors.grey.shade800) {
                      iconColor = Colors.red;
                    } else if (iconColor == Colors.red) {
                      iconColor = Colors.grey.shade800;
                    }
                  });
                },
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.favorite,
                  color: iconColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}