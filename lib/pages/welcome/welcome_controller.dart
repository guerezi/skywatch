import 'package:geolocator/geolocator.dart';
import 'package:skywatch/domain/models/location.dart';
import 'package:skywatch/domain/models/weather/weather.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class WelcomeController extends SkywatchController {
  WelcomeController({required this.presenter});

  final WelcomePresenter presenter;
  Location? location;

  @override
  void initListeners() {
    initWeatherListeners();
    initLocationListeners();
  }

  void initWeatherListeners() {
    presenter.getWeatherOnComplete = () => onComplete('Weather');
    presenter.getWeatherOnError = onError;
    presenter.getWeatherOnNext = getWeatherOnNext;
  }

  void getWeatherOnNext(Weather weather) {
    location!.weather = weather;
    refreshUI();
  }

  void requestWeather() {
    presenter.getWeather(location!.latLng);
    //Loading
  }

  void initLocationListeners() {
    presenter.getLocationOnComplete = () => onComplete('Location');
    presenter.getLocationOnError = onError;
    presenter.getLocationOnNext = getLocationOnNext;
  }

  void getLocationOnNext(Location location) {
    location = location;
    refreshUI();
  }

  Future<void> requestGPSPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
