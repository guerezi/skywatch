import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/user.dart';
import 'package:skywatch/domain/repositories/user_repository.dart';
import 'package:skywatch/domain/usecases/get_user_usecase.dart';
import 'package:skywatch/pages/profile/observer/user_observer.dart';

class ProfilePresenter extends Presenter {
  ProfilePresenter({
    required IUserRepository userRepository,
  }) : _userUsecase = GetUserUseCase(userRepository);

  final GetUserUseCase _userUsecase;

  Function()? getUserOnComplete;
  Function(dynamic)? getUserOnError;
  Function(User)? getUserOnNext;

  void getUser() {
    _userUsecase.execute(
      UserUseCaseObserver(this),
      UserRequestData(),
    );
  }

  @override
  void dispose() {
    _userUsecase.dispose();
  }
}
