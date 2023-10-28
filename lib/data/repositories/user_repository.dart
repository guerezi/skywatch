import 'package:dio/dio.dart';
import 'package:skywatch/domain/repositories/user_repository.dart';

class UserRepository extends IUserRepository {
  @override
  Future<Response> getUser() async {
    // Pls pretend that there is a fancy API request here

    return Response(
      requestOptions: RequestOptions(),
      data: {
        'name': 'John Doe',
        'level': 10,
        'homeTown': 'Dallas',
        'cities': [
          {
            "name": "London",
            "lat": 51.5073219,
            "lon": -0.1276474,
            "country": "GB",
            "state": "England"
          },
          {
            "name": "London",
            "lat": 42.9832406,
            "lon": -81.243372,
            "country": "CA",
            "state": "Ontario"
          },
        ]
      },
    );
  }
}
