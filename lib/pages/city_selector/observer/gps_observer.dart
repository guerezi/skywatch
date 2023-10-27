import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/gps_usecase.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';

class GPSUseCaseObserver extends Observer<GPSRequestResponse> {
  final CitySelectorPresenter presenter;
  GPSUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getGPSOnComplete != null);
    presenter.getGPSOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getGPSOnError != null);
    presenter.getGPSOnError!(e);
  }

  @override
  void onNext(dynamic response) {
    assert(presenter.getGPSOnNext != null);
    presenter.getGPSOnNext!((response as GPSRequestResponse).position);
  }
}
