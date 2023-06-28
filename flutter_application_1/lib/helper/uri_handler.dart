class URIHandler {
  static const int pageSize = 50;

  static Uri getHousesUri(int page) {
    return Uri(
      scheme: 'https',
      host: 'anapioficeandfire.com',
      pathSegments: ['api', 'houses'],
      queryParameters: {'page': '$page', 'pageSize': '$pageSize'},
    );
  }
}