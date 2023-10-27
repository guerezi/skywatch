import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_weather_usecase.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class WeatherUseCaseObserver extends Observer<WeatherRequestResponse> {
  final WelcomePresenter presenter;
  WeatherUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getWeatherOnComplete != null);
    presenter.getWeatherOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getWeatherOnError != null);
    presenter.getWeatherOnError!(e);
  }

  @override
  void onNext(dynamic response) {
    assert(presenter.getWeatherOnNext != null);
    presenter.getWeatherOnNext!((response as WeatherRequestResponse).weather);
  }
}
