import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameStartPage extends StatelessWidget {
  const GameStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        startBackground(),
        Align(alignment: Alignment.center, child: gameLogo()),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(180, 0, 0, 0),
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Colors.redAccent.shade700))),
            ),
          ),
        ),
        startMenu()
      ],
    )));
  }

  Widget startBackground() {
    return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/start_page/background.jpg"),
                fit: BoxFit.cover)));
  }

  Widget startMenu() {
    return OverflowBox(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RawMaterialButton(
                enableFeedback: false,
                fillColor: Colors.blueGrey.shade200,
                onPressed: () {},
                shape: const CircleBorder(side: BorderSide.none),
                child: const FaIcon(FontAwesomeIcons.gear),
              ),
              RawMaterialButton(
                enableFeedback: false,
                fillColor: Colors.blueGrey.shade200,
                onPressed: () {},
                shape: const CircleBorder(side: BorderSide.none),
                child: const FaIcon(FontAwesomeIcons.rotate),
              ),
              SizedBox(
                height: 65,
                width: 85,
                child: RawMaterialButton(
                  mouseCursor: MouseCursor.defer,
                  enableFeedback: false,
                  fillColor: const Color.fromARGB(255, 255, 0, 0),
                  onPressed: () {},
                  shape: const CircleBorder(side: BorderSide.none),
                  child: const FaIcon(FontAwesomeIcons.play),
                ),
              ),
              RawMaterialButton(
                enableFeedback: false,
                fillColor: Colors.blueGrey.shade200,
                onPressed: () {},
                shape: const CircleBorder(side: BorderSide.none),
                child: const FaIcon(FontAwesomeIcons.upload),
              ),
              RawMaterialButton(
                enableFeedback: false,
                fillColor: Colors.blueGrey.shade200,
                onPressed: () {},
                shape: const CircleBorder(side: BorderSide.none),
                child: const FaIcon(FontAwesomeIcons.circleInfo),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget gameLogo() {
    return Container(
      height: 265,
      width: 300,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/start_page/logo.png"),
              fit: BoxFit.cover)),
    );
  }
}
