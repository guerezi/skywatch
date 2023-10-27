enum Routes {
  city('city'),
  videos('videos'),
  weather('weather'),
  profile('profile'),
  welcome('welcome');

  const Routes(this.name);

  final String name;

  String get path => '/$name';
}
