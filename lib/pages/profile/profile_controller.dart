import 'package:skywatch/domain/models/user.dart';
import 'package:skywatch/pages/common/skywatch_controller.dart';
import 'package:skywatch/pages/profile/profile_presenter.dart';

class ProfileController extends SkywatchController {
  ProfileController({required this.presenter});

  final ProfilePresenter presenter;
  User? user;

  @override
  void onInitState() {
    super.onInitState();
    requestUser();
  }

  @override
  void initListeners() {
    initUserListeners();
  }

  void initUserListeners() {
    presenter.getUserOnComplete = () => onComplete('User');
    presenter.getUserOnError = onError;
    presenter.getUserOnNext = getUserOnNext;
  }

  void getUserOnNext(User newUser) {
    user = newUser;
    refreshUI();
  }

  void requestUser() {
    presenter.getUser();
  }

  @override
  void onDisposed() {
    presenter.dispose();
    super.onDisposed();
  }
}
