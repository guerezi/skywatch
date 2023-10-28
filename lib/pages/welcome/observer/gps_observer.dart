import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_gps_usecase.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class GPSUseCaseObserver extends Observer<GPSRequestResponse> {
  final WelcomePresenter presenter;
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
