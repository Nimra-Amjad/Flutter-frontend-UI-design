import 'dart:html';

import 'package:flutter/material.dart';

import 'package:bank_management/common/model.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardInfo> cardSet = [
    CardInfo("Cardy Bank", "assets/images/cd1.jpg", "1234-5678-****", "lomio",
        false, "1-jan-2021", "1-feb-2021"),
    CardInfo("Cardy Bank", "assets/images/cd2.jpg", "1233-5378-****", "lomio",
        false, "1-jan-2022", "1-aug-2022"),
    CardInfo("Admin Bank", "assets/images/cd3.jpg", "2234-5278-****", "lomio",
        true, "1-jan-2020", "1-feb-2020"),
  ];
  Map<String, double> dataMap = {
    "Food": 40,
    "Car Oil": 30,
    "Etc": 20,
    "Bus": 3,
    "Subway": 7,
  };

  List<ServiceInfo> serviceset = [
    ServiceInfo(
        const Icon(
          Icons.qr_code,
          size: 60,
          color: Colors.white,
        ),
        "QR CODE"),
    ServiceInfo(
        const Icon(
          Icons.card_travel,
          size: 60,
          color: Colors.white,
        ),
        "CREDIT"),
    ServiceInfo(
        const Icon(
          Icons.wallet_giftcard_sharp,
          size: 60,
          color: Colors.white,
        ),
        "GIFT BOX")
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(size),
              buildSectionText("My Card"),
              Container(
                width: double.infinity,
                height: size.height * .26,
                child: ListView.builder(
                    itemCount: cardSet.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return CardSelection(
                          size: size, cardinfo: cardSet[index]);
                    })),
              ),
              Padding(
                padding: const EdgeInsets.all(.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionText("Mostly Used"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PieChart(
                        colorList: const [
                          Colors.black54,
                          Colors.black45,
                          Colors.black38,
                          Colors.black26,
                          Colors.black12,
                        ],
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: true,
                          decimalPlaces: 1,
                        ),
                        chartType: ChartType.ring,
                        ringStrokeWidth: 32,
                        animationDuration: const Duration(milliseconds: 400),
                        dataMap: dataMap,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionText("Card Services"),
                    Container(
                      height: size.height * .25,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: serviceset.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: size.height * .025, left: 15, right: 15),
                            child: Container(
                              width: size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color.fromRGBO(66, 111, 120, 1),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(10, 5),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        color: Colors.black)
                                  ]),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: serviceset[index].icon,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text(
                                        serviceset[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Padding buildSectionText(String title) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
      ),
    );
  }

  Row buildAppBar(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Hello Nimra\n",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white)),
          TextSpan(
              text: "Candy Card",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white))
        ])),
        InkWell(
            onTap: () {},
            child: Container(
              height: size.height * .12,
              width: size.width * .175,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 4,
                        color: Colors.black12)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(110, 200, 242, 1),
                        Color.fromRGBO(66, 111, 120, 1)
                      ])),
              child: Center(
                child: Container(
                  height: size.height * .88,
                  width: size.width * .145,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(110, 200, 242, 1),
                            Color.fromRGBO(66, 111, 120, 1)
                          ])),
                  child: const Icon(
                    Icons.face,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

class CardSelection extends StatelessWidget {
  const CardSelection({
    Key? key,
    required this.size,
    required this.cardinfo,
  }) : super(key: key);

  final Size size;
  final CardInfo cardinfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        width: size.width * .9,
        child: CustomPaint(
          painter: GradientBorderPainter(
            gradient: const LinearGradient(colors: [
              Colors.white,
              Colors.grey,
              Colors.blueGrey,
              Colors.grey,
              Colors.white12
            ]),
            strokeWidth: 2,
          ),
          child: Container(
            child: Hero(
              tag: cardinfo.bankname,
              child: Container(
                decoration: cardinfo.imgsrc != ""
                    ? BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(cardinfo.imgsrc),
                            fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(15))
                    : const BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 4)
                      ]),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Credit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            cardinfo.bankname,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                      cardinfo.addcard == false
                          ? Padding(
                              padding: EdgeInsets.only(top: size.height * .125),
                              child: Row(
                                children: [Text(cardinfo.cardNum)],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Column(children: [
                                Container(
                                  height: size.height * .88,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(.3)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(.5),
                                  child: Text(
                                    "Add a cart",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                )
                              ]),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final Paint paintj = Paint();

  GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
  });

  @override
  paint(Canvas canvas, Size size) {
    Rect inRect = Rect.fromLTRB(strokeWidth, strokeWidth,
        size.width - strokeWidth, size.height - strokeWidth);
    Rect outRect = Offset.zero & size;
    paintj.shader = gradient.createShader(outRect);
    Path borderPath = calculatePath(outRect, inRect, size);
    canvas.drawPath(borderPath, paintj);
  }

  Path calculatePath(Rect outRect, Rect inRect, Size size) {
    Path outReactPath = Path()
      ..addRRect(RRect.fromRectAndRadius(outRect, const Radius.circular(15)));

    Path inReactPath = Path()
      ..addRRect(RRect.fromRectAndRadius(inRect, const Radius.circular(15)));

    return Path.combine(PathOperation.difference, outReactPath, inReactPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
