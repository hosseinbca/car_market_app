import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class carsclass {
  String name, model, about;
  double price;
  Image image;
  carsclass(this.name, this.model, this.about, this.price, this.image) {}
}

List<carsclass> marketitemslist = [
  carsclass(
      "Mercedes Benz",
      "S class",
      "mercedes luxury car",
      400,
      Image.asset(
        'assets/images/s_class.jpg',
        height: 100,
      )),
  carsclass(
      "BMW",
      "7 Series",
      "bmw luxury car",
      300,
      Image.asset(
        'assets/images/7_series.jpg',
        height: 100,
      )),
  carsclass(
      "Tesla",
      "Model S",
      "tesla car",
      250,
      Image.asset(
        'assets/images/Model_S.jpg',
        height: 100,
      )),
  carsclass(
      "Ferrari",
      "Roma",
      "luxury car",
      450,
      Image.asset(
        'assets/images/roma.jpg',
        height: 100,
      )),
  carsclass(
      "Lamborghini",
      "Huracan",
      " luxury car",
      450,
      Image.asset(
        'assets/images/huracan.jpg',
        height: 100,
      )),
  carsclass(
      "Porsche",
      "911",
      " luxury car",
      400,
      Image.asset(
        'assets/images/911_turbo.jpg',
        height: 100,
      )),
  carsclass(
      "Bugatti",
      "Divo",
      " luxury car",
      800,
      Image.asset(
        'assets/images/Divo.jpg',
        height: 100,
      )),
  carsclass(
      "Rolls Royce",
      "Phantom",
      " luxury car",
      650,
      Image.asset(
        'assets/images/Phantom.png',
        height: 100,
      )),
  carsclass(
      "Chevrolet",
      "Camaro zL1",
      " luxury car",
      650,
      Image.asset(
        'assets/images/Camaro_zL1.jpg',
        height: 100,
      )),
  carsclass(
      "Maserati",
      "Ghibli",
      " luxury car",
      650,
      Image.asset(
        'assets/images/Ghibli.jpg',
        height: 100,
      )),
  carsclass(
      "Bentley",
      "Continental GT",
      " luxury car",
      650,
      Image.asset(
        'assets/images/continental_gt.png',
        height: 100,
      )),
  carsclass(
      "Chevrolet",
      "Corvette C8",
      " luxury car",
      650,
      Image.asset(
        'assets/images/Corvette _C8.jpg',
        height: 100,
      )),
  carsclass(
      "Lexus",
      "LC 500",
      " luxury car",
      650,
      Image.asset(
        'assets/images/LC_500.jpg',
        height: 100,
      )),
  carsclass(
      "Ford",
      "Mustang",
      " luxury car",
      650,
      Image.asset(
        'assets/images/Mustang.jpg',
        height: 100,
      )),
  carsclass(
      "AUDI",
      "R8",
      " luxury car",
      650,
      Image.asset(
        'assets/images/r8.jpg',
        height: 100,
      )),
];
