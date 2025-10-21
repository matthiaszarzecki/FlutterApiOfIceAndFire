class URIHandler {
  static const int _pageSize = 50;

  static Uri getHousesUri(int page) {
    return Uri(
      scheme: 'https',
      host: 'anapioficeandfire.com',
      pathSegments: ['api', 'houses'],
      queryParameters: {'page': '$page', 'pageSize': '$_pageSize'},
    );
  }
}