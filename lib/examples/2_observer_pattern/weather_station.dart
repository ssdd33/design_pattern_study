import 'package:design_pattern_study/examples/2_observer_pattern/interface.dart';

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
