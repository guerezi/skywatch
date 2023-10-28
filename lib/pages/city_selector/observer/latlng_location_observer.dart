import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_location_by_latlgn_usecase.dart';
import 'package:skywatch/pages/city_selector/city_selector_presenter.dart';

class LatLngLocationUseCaseObserver extends Observer<LocationRequestResponse> {
  final CitySelectorPresenter presenter;
  LatLngLocationUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getLocationBylatlngOnComplete != null);
    presenter.getLocationBylatlngOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getLocationBylatlngOnError != null);
    presenter.getLocationBylatlngOnError!(e);
  }

  @override
  void onNext(dynamic response) {
    assert(presenter.getLocationBylatlngOnNext != null);
    presenter.getLocationBylatlngOnNext!(
      (response as LocationRequestResponse).location,
    );
  }
}
