class QueryMutation {
  //* Get all countries...
  String getCountries = '''
  query GetCountries{
    countries{
      name
      isoCode
    }
  }
''';
}
