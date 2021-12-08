import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlClassEx2 {
  static HttpLink httpLink = HttpLink("https://graphqlzero.almansi.me/api");

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
