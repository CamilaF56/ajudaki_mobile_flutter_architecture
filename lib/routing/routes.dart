abstract final class Routes {
  static const home = search;

  static const search = '/';

  static const detailsRelative = 'details';
  static const details = '/$detailsRelative';
  static String detailsWithId(int id) => '/$details/$id';
}
