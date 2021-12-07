import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_example_1/GQLConfigs/gqlProvider.dart';
import 'package:graphql_example_1/GQLConfigs/query_mutation.dart';
import 'package:graphql_example_1/Model/CountryModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GraphQlClass graphQlClass = GraphQlClass();
  CountryModel countryModel = CountryModel();
  // List countries = [];
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
        body:
            countryModel.countries != null && countryModel.countries!.isNotEmpty
                ? ListView.builder(
                    itemCount: countryModel.countries!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
