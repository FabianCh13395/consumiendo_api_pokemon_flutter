import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final heroTag;
  final Wpoknom;
  final Wpoktipo;
  final WpokNum;
  final WpokImage;
  final WpokAltura;
  final WpokPeso;
  const DetailScreen(
      {this.heroTag,
      this.Wpoknom,
      this.Wpoktipo,
      this.WpokNum,
      this.WpokImage,
      this.WpokAltura,
      this.WpokPeso});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.Wpoktipo == "Grass"
          ? Colors.greenAccent
          : widget.Wpoktipo == "Fire"
              ? Colors.redAccent
              : widget.Wpoktipo == "Water"
                  ? Colors.blueAccent
                  : widget.Wpoktipo == "Poison"
                      ? Colors.purpleAccent
                      : widget.Wpoktipo == "Rock"
                          ? Colors.brown
                          : widget.Wpoktipo == "Electric"
                              ? Colors.lightBlue
                              : widget.Wpoktipo == "Normal"
                                  ? Colors.blueGrey
                                  : widget.Wpoktipo == "Ice"
                                      ? Colors.cyan
                                      : widget.Wpoktipo == "Psychic"
                                          ? Colors.amberAccent
                                          : Colors.grey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FlechaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Altura:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                              child: Text(
                            widget.WpokAltura.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))
                        ])),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Peso:",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                              child: Text(
                            widget.WpokPeso.toString(),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ))
                        ]))
                  ]),
                ),
              )),
          Positioned(
              top: height * 0.2,
              child: Hero(
                tag: widget.heroTag,
                child: CachedNetworkImage(
                  imageUrl: widget.WpokImage,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    );
  }

  Widget _FlechaAtras() {
    return Positioned(
        top: 35,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _NombreNumeroPokemon() {
    return Positioned(
        top: 90,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Wpoknom.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("   #" + widget.WpokNum.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ));
  }

  Widget _TipoPokemon() {
    return Positioned(
        top: 130,
        left: 25,
        child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.Wpoktipo.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(20)))));
  }

  Widget _PokeballFondo() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      right: -30,
      top: height * 0.18,
      child: Image.asset(
        'images/pokeball80.png',
        height: 200,
        fit: BoxFit.fitHeight,
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
