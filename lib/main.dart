import 'package:design_pattern_study/examples/ch1/strategy_pattern.dart';

void main() {
  Duck decoyDuck = DecoyDuck();
  Duck mallardDuck = MalladDuck();

  decoyDuck.swim();
  decoyDuck.performFly();
  decoyDuck.performQuack();
  decoyDuck.display();

  mallardDuck.performFly();

  mallardDuck.flyBehavior = FlyNoWay();

  mallardDuck.performFly();
}
