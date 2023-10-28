import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:skywatch/domain/models/user.dart';
import 'package:skywatch/domain/repositories/user_repository.dart';

class GetUserUseCase extends UseCase<UserRequestResponse, UserRequestData> {
  GetUserUseCase(this.userRepository);

  final IUserRepository userRepository;

  @override
  Future<Stream<UserRequestResponse>> buildUseCaseStream(
    UserRequestData? params,
  ) async {
    final controller = StreamController<UserRequestResponse>();

    try {
      final response = await userRepository.getUser();

      controller.add(
        UserRequestResponse(User.fromMap(response.data)),
      );
    } catch (e) {
      logger.severe('$runtimeType unsuccessful.');
      controller.addError(e);
    } finally {
      controller.close();
    }
    return controller.stream;
  }
}

class UserRequestData {
  UserRequestData();
}

class UserRequestResponse {
  final User user;
  UserRequestResponse(this.user);
}
