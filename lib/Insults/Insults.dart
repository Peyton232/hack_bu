import 'dart:math';

class Insults{
  List<String> insultString = [
    "You did not have to buy that you dunce!", "Your an idiot sandwich!"
  ];

  String get getInsult{
    var rng = new Random();
    return insultString[rng.nextInt(insultString.length)];
  }

}