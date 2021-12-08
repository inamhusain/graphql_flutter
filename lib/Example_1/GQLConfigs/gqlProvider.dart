import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlClassEx1 {
  static HttpLink httpLink = HttpLink("https://api.graphql.jobs/");

  static ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    ),
  );

  GraphQLClient clienttoQuery() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }
  // k
}
