import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_location_by_name_usecase.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';

class LocationUseCaseObserver extends Observer<LocationRequestResponse> {
  final CitySelectorPresenter presenter;
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
