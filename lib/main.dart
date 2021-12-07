import 'package:flutter/material.dart';
import 'package:graphql_example_1/GQLConfigs/gqlProvider.dart';
import 'package:graphql_example_1/views/HomeScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlClass.client,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
