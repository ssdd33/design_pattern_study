/*
- 앱을 구상할때는 항상 변경될 가능성이 있는 부분과 바뀌지 않아야할 부분을 구분해야한다.. 재사용과 확장성을 고려하면서도 기존 코드에 변경을 불러일으키지 않을 수 있어야한다 (open close principle).
- 구현된 코드 기준이 아닌 상위타입(인터페이스, 추상 클래스등)기준으로 작성되어야한다 .. 실행중에도 코드 변경이 가능함

- 상속보다는 구성(composition)을 활용한다 : 알고리즘군 (나는 행동들, 꽥꽥거리는 행동들)을 별도의 클래스 집합으로 캡슐화하여 이를 구성 요소로 사용하는 객체에서 올바른 행동 인터페이스를 구현 
- 전략 패턴 strategy pattern : 알고리즘군을 정의하고 캡슐화해서 각각의 알고리즘군을 수정해서 쓸 수 있게 해 준다. 전략 패턴을 사용하면 클라이언트로부터 알고리즘을 분리해서 독립적으로 변경할 수 있다.
*/

abstract class Duck {
  QuackBehavior _quackBehaivor;
  FlyBehavior _flyBehavior;
  Duck(
    this._quackBehaivor,
    this._flyBehavior,
  );

  void swim() {
    print('swim');
  }

  void display();

  void performQuack() {
    _quackBehaivor.quack();
  }

  void performFly() {
    _flyBehavior.fly();
  }

  void set quackBehaivor(QuackBehavior quackBehavior) =>
      _quackBehaivor = quackBehavior;
  void set flyBehavior(FlyBehavior flyBehavior) => _flyBehavior = flyBehavior;
}

abstract class QuackBehavior {
  void quack();
}

class Quack extends QuackBehavior {
  @override
  void quack() {
    print('quack quack ');
  }
}

class Squack extends QuackBehavior {
  @override
  void quack() {
    print('squack squack ');
  }
}

abstract class FlyBehavior {
  void fly();
}

class FlyWithWings extends FlyBehavior {
  @override
  void fly() {
    print('fly!');
  }
}

class FlyNoWay extends FlyBehavior {
  @override
  void fly() {
    print("just try but fail..");
  }
}

class MalladDuck extends Duck {
  MalladDuck() : super(Quack(), FlyWithWings());

  @override
  void display() {
    print('display mallardDuck');
  }
}

class DecoyDuck extends Duck {
  DecoyDuck() : super(Squack(), FlyNoWay());

  @override
  void display() {
    print('display decoyDuck');
  }
}
