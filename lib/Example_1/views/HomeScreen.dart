import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_example_1/Example_1/GQLConfigs/gqlProvider.dart';
import 'package:graphql_example_1/Example_1/GQLConfigs/query_mutation.dart';
import 'package:graphql_example_1/Example_1/Model/CountryModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Ex1HomeScreen extends StatefulWidget {
  @override
  State<Ex1HomeScreen> createState() => _Ex1HomeScreenState();
}

class _Ex1HomeScreenState extends State<Ex1HomeScreen> {
  final GraphQlClassEx1 graphQlClass = GraphQlClassEx1();
  CountryModel countryModel = CountryModel();
  @override
  void initState() {
    super.initState();
    GetCountries();
  }

  void GetCountries() async {
    GraphQLClient client = graphQlClass.clienttoQuery();
    QueryResult result = await client.query(
      QueryOptions(
        document: gql(QueryMutationEx1().getCountries),
      ),
    );
    String responseDetail = JsonEncoder.withIndent(' ').convert(result.data);
    countryModel = CountryModel.fromJson(json.decode(responseDetail));
    // print(countryModel.countries![0].name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GQl City list"),
        ),
        body: countryModel.countries != null &&
                countryModel.countries!.isNotEmpty
            ? ListView.builder(
                itemCount: countryModel.countries!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.2))
                    ]),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            countryModel.countries![index].name.toString(),
                          ),
                          Text(countryModel.countries![index].isoCode
                              .toString()
                              .toUpperCase())
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
