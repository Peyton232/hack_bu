import 'dart:math';

class Insults{
  List<String> insultString = [
    "You did not have to buy that you dunce!", "Your an idiot sandwich!"
  ];

  void getInsult(){
    var rng = new Random();
    print(insultString[rng.nextInt(insultString.length)]);
  }

}