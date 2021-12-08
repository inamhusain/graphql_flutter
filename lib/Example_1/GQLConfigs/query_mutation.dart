class QueryMutationEx1 {
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
