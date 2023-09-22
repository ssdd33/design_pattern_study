abstract class Beverage {
  String description = "제목 없음";

  double cost();

  String getDescription() {
    return description;
  }
}

abstract class CondimentDecorator extends Beverage {
  final Beverage beverage;
  CondimentDecorator({
    required this.beverage,
  });
}

class Espresso extends Beverage {
  Espresso() {
    description = "espresso";
  }
  @override
  double cost() {
    return 1.99;
  }
}

class Houseblend extends Beverage {
  Houseblend() {
    description = "houseblend";
  }

  @override
  double cost() {
    return .89;
  }
}

class Mocha extends CondimentDecorator {
  Mocha({required super.beverage});

  @override
  double cost() {
    return beverage.cost() + .20;
  }

  @override
  String getDescription() {
    return beverage.getDescription() + " , mocha";
  }
}

class Soy extends CondimentDecorator {
  Soy({required super.beverage});

  @override
  double cost() {
    return beverage.cost() + .15;
  }

  @override
  String getDescription() {
    return beverage.getDescription() + " , soy";
  }
}

class Whip extends CondimentDecorator {
  Whip({required super.beverage});

  @override
  double cost() {
    return beverage.cost() + .10;
  }

  @override
  String getDescription() {
    return beverage.getDescription() + " , whip";
  }
}
