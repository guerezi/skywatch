import 'package:dio/dio.dart';

abstract class IUserRepository {
  Future<Response> getUser();
}
