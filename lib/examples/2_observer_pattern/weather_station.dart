import 'package:design_pattern_study/examples/2_observer_pattern/interface.dart';

/*
- 옵저버 패턴은 한 객체의 상태가 바뀌면 그 객체에 의존하는 다른 객체에게 연락이 가고 자동으로 내용이 갱신되는 방식으로 일대다(one-to-many)의존성을 정의한다.
- 상호작용하는 객체 사이에는 가능하면 느슨한 결합을 사용해야 한다. 
- 느슨하게 결한하는 디자인을 사용하면 변경 사항이 생겨도 무난히 처리할 수 있는 유연한 객체지향 시스템을 구축할 수 있다. 객체 사이의 상호의존성을 최소화 할 수 있기 때문이다.
*/

class WeatherStation {
  WeatherData weatherData = WeatherData();
  late Observer currentConditionDisplay;

  WeatherStation() {
    currentConditionDisplay = CurrentConditionDisplay(weatherData);
  }

  void updateMeasurements(int temperature, int humidity, int pressure) {
    weatherData.changeMeasurement(temperature, humidity, pressure);
  }
}

class Measurements {
  int temperature = 0;
  int humidity = 0;
  int pressure = 0;

  void onChangeMeasureMents(int temp, int hum, int pres) {
    temperature = temp;
    humidity = hum;
    pressure = pres;
  }
}

class WeatherData extends Subject<Measurements> {
  late List<Observer<Measurements>> observers;
  late Measurements measurements;

  WeatherData() {
    observers = [];
    measurements = Measurements();
  }

  void changeMeasurement(int temperature, int humidity, int pressure) {
    measurements.onChangeMeasureMents(temperature, humidity, pressure);
    notifyObservers();
  }

  @override
  void notifyObservers() {
    observers.forEach((observer) => observer.update(measurements));
  }

  @override
  void registObserver(Observer<Measurements> observer) {
    observers.add(observer);
  }

  @override
  void removeObserver(Observer<Measurements> observer) {
    observers.remove(observer);
  }
}

class CurrentConditionDisplay extends ThirdPartyDisplay<Measurements> {
  late Measurements measurements;

  CurrentConditionDisplay(Subject<Measurements> subject) : super(subject) {
    measurements = Measurements();
    subject.registObserver(this);
  }
  @override
  void display() {
    print(
        " ------current_condition-------\nt:${measurements.temperature},h:${measurements.humidity}, p:${measurements.pressure}\n");
  }

  @override
  void update(param) {
    measurements = param;
    display();
  }
}
