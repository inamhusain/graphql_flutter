import 'package:flutter/material.dart';
import 'package:graphql_example_1/GQLConfigs/gqlProvider.dart';
import 'package:graphql_example_1/GQLConfigs/query_mutation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GraphQlClass graphQlClass = GraphQlClass();
  @override
  void initState() {
    super.initState();
    GetCountries();
  }

  void GetCountries() async {
    GraphQLClient client = graphQlClass.clienttoQuery();
    QueryResult result = await client.query(
      QueryOptions(
        document: gql(QueryMutation().getCountries),
      ),
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
