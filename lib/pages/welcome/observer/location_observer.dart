import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_location_usecase.dart';
import 'package:skywatch/pages/welcome/welcome_presenter.dart';

class LocationUseCaseObserver extends Observer<LocationRequestResponse> {
  final WelcomePresenter presenter;
  LocationUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getLocationOnComplete != null);
    presenter.getLocationOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getLocationOnError != null);
    presenter.getLocationOnError!(e);
  }

  @override
  void onNext(dynamic response) {
    assert(presenter.getLocationOnNext != null);
    presenter.getLocationOnNext!(
      (response as LocationRequestResponse).location,
    );
  }
}
