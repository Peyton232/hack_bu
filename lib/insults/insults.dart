import 'dart:math';

class Insults{
  List<String> insultString = [
    "You did not have to buy that you dunce!", "Your an idiot sandwich!", "Listen, It is always better to let someone think you’re an idiot rather than to actually prove it.", "Sweetie, I'm gonna need you to put those few remaining brain cells together and work with me here, okay?",
    "Some people seem to have an endless supply of stupid.", "You have two parts of brain, 'left' and 'right'. In the left side, there's nothing right. In the right side, there's nothing left.", "I don't think you are stupid. You just have a bad luck when thinking.",
  "I'm not insulting you. I'm describing you.", "So, a thought crossed your mind? Must have been a long and lonely journey.", "Do the math, was that a good purchase?"
  ];

  String get getInsult{
    var rng = new Random();
    return insultString[rng.nextInt(insultString.length)];
  }

}