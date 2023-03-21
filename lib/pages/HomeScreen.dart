import 'package:cached_network_image/cached_network_image.dart';
import 'package:fabian_app_pokedex/controller/getDataController.dart';
import 'package:fabian_app_pokedex/pages/DetalleScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getDataController = Get.put(GetDataController());
  @override
  void initState() {
    getDataController.getDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: !getDataController.isLoading.value
            ? Stack(
                children: [
                  _ImagenFondo(),
                  _TextoTitulo(),
                  Positioned(
                      top: 150,
                      bottom: 0,
                      width: width,
                      child: Column(
                        children: [
                          Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.4),
                                  itemCount: 151,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: InkWell(
                                        child: SafeArea(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                              color: getDataController
                                                          .getDataModel
                                                          .value
                                                          .results[index]
                                                          .pokTipo ==
                                                      "Grass"
                                                  ? Colors.greenAccent
                                                  : getDataController
                                                              .getDataModel
                                                              .value
                                                              .results[index]
                                                              .pokTipo ==
                                                          "Fire"
                                                      ? Colors.redAccent
                                                      : getDataController
                                                                  .getDataModel
                                                                  .value
                                                                  .results[
                                                                      index]
                                                                  .pokTipo ==
                                                              "Water"
                                                          ? Colors.blueAccent
                                                          : getDataController
                                                                      .getDataModel
                                                                      .value
                                                                      .results[
                                                                          index]
                                                                      .pokTipo ==
                                                                  "Poison"
                                                              ? Colors
                                                                  .purpleAccent
                                                              : getDataController
                                                                          .getDataModel
                                                                          .value
                                                                          .results[
                                                                              index]
                                                                          .pokTipo ==
                                                                      "Rock"
                                                                  ? Colors.brown
                                                                  : getDataController
                                                                              .getDataModel
                                                                              .value
                                                                              .results[
                                                                                  index]
                                                                              .pokTipo ==
                                                                          "Electric"
                                                                      ? Colors
                                                                          .lightBlue
                                                                      : getDataController.getDataModel.value.results[index].pokTipo ==
                                                                              "Normal"
                                                                          ? Colors
                                                                              .blueGrey
                                                                          : getDataController.getDataModel.value.results[index].pokTipo == "Ice"
                                                                              ? Colors.cyan
                                                                              : getDataController.getDataModel.value.results[index].pokTipo == "Psychic"
                                                                                  ? Colors.amberAccent
                                                                                  : Colors.grey,
                                            ),
                                            child: Stack(
                                              children: [
                                                _PokebalInterno(),
                                                _ImagenPokemon(index),
                                                _NombrePokemon(index),
                                                _TipoPokemon(index)
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DetailScreen(
                                                        heroTag: index,
                                                        Wpoknom:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokName,
                                                        Wpoktipo:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokTipo,
                                                        WpokNum:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokNum,
                                                        WpokImage:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokImg,
                                                        WpokAltura:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokAltura,
                                                        WpokPeso:
                                                            getDataController
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokPeso,
                                                      )));
                                        },
                                      ),
                                    );
                                  }))
                        ],
                      ))
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
        top: 200,
        right: 10,
        child: Image.asset(
          'images/pokeball80.png',
          fit: BoxFit.fitWidth,
          width: 150,
        ));
  }

  Widget _TextoTitulo() {
    return Positioned(
        top: 100,
        left: 20,
        child: Text(
          'CataPokex',
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ));
  }

  Widget _NombrePokemon(index) {
    return Positioned(
      top: 30,
      left: 10,
      child: Text(
        getDataController.getDataModel.value.results[index].pokName,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _PokebalInterno() {
    return Positioned(
      bottom: -10,
      right: -10,
      child: Image.asset(
        'images/pokeball80.png',
        fit: BoxFit.fitHeight,
        height: 100,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _ImagenPokemon(index) {
    return Positioned(
        bottom: 5,
        right: 5,
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            imageUrl:
                getDataController.getDataModel.value.results[index].pokGif,
            height: 80,
            fit: BoxFit.fitWidth,
            placeholder: ((context, url) => Center(
                  child: CircularProgressIndicator(),
                )),
          ),
        ));
  }

  Widget _TipoPokemon(index) {
    return Positioned(
        top: 55,
        left: 15,
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              getDataController.getDataModel.value.results[index].pokTipo
                  .toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.5)),
        ));
  }
}
