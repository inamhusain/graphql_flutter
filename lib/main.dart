import 'package:flutter/material.dart';
import 'package:graphql_example_1/Example_1/GQLConfigs/gqlProvider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'Example_1/views/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQlClassEx1.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Ex1HomeScreen(),
      ),
    );
  }
}
