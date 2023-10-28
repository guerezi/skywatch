import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/usecases/get_user_usecase.dart';
import 'package:skywatch/pages/profile/profile_presenter.dart';

class UserUseCaseObserver extends Observer<UserRequestResponse> {
  final ProfilePresenter presenter;
  UserUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getUserOnComplete != null);
    presenter.getUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getUserOnError != null);
    presenter.getUserOnError!(e);
  }

  @override
  void onNext(dynamic response) {
    assert(presenter.getUserOnNext != null);
    presenter.getUserOnNext!(
      (response as UserRequestResponse).user,
    );
  }
}
