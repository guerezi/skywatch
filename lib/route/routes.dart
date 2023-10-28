enum Routes {
  city('city'),
  cities('cities'),
  videos('videos'),
  weather('weather'),
  profile('profile'),
  welcome('welcome');

  const Routes(this.name);

  final String name;

  String get path => '/$name';
}
