abstract class Subject<T> {
  void registObserver(Observer<T> observer);
  void removeObserver(Observer<T> observer);
  void notifyObservers();
}

abstract class Observer<T> {
  void update(T param);
}

abstract class DisplayElement {
  void display();
}

//외부 개발자가 새로운 디스플레이 요소 추가시 제공
abstract class ThirdPartyDisplay<T> implements Observer<T>, DisplayElement {
  final Subject<T> subject;
  ThirdPartyDisplay(this.subject);
}
