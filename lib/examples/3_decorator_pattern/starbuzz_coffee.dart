import 'package:design_pattern_study/examples/3_decorator_pattern/model.dart';

test() {
  Beverage beverage1 = Espresso();
  print("${beverage1.getDescription()} \$ ${beverage1.cost()}");

  Beverage beverage2 = Houseblend();
  beverage2 = Mocha(beverage: beverage2);
  beverage2 = Mocha(beverage: beverage2);
  beverage2 = Whip(beverage: beverage2);
  print("${beverage2.getDescription()} \$ ${beverage2.cost()}");

  Beverage beverage3 = Houseblend();
  beverage3 = Soy(beverage: beverage3);
  beverage3 = Mocha(beverage: beverage3);
  beverage3 = Whip(beverage: beverage3);
  print("${beverage3.getDescription()} \$ ${beverage3.cost()}");
}
