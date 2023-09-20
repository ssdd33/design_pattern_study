import 'package:design_pattern_study/examples/1_strategy_pattern/duck_simulator.dart';
import 'package:design_pattern_study/examples/2_observer_pattern/interface.dart';
import 'package:design_pattern_study/examples/2_observer_pattern/weather_station.dart';

void main() {
  WeatherStation ws = WeatherStation();

  ws.updateMeasurements(1, 2, 3);
  ws.updateMeasurements(11, 22, 33);
  ws.updateMeasurements(44, 55, 66);
}
