
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/country.dart';
import 'package:http/http.dart' as http;

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {


  Future<List<Country>> getAllCountries() async {
    List<Country> countries = [];

    String endPoint = 'https://countriesnow.space/api/v0.1/countries/flag/images';
    // send a GET request to server

    // Receive Response
    http.Response response = await http.get( Uri.parse(endPoint) );

    // check if status code is 200
    if( response.statusCode == 200){
      // extract json country

      var jsonResponse = jsonDecode( response.body );

      var jsonCountryList = jsonResponse['data'];

      for( var jsonCountry in jsonCountryList)
      {
        // convert to Dart object
        Country country = Country.fromJson(jsonCountry);

        // Add in countries List
        countries.add(country);
      }

    }else{

    }

    return countries;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country List'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Country>>(
          future: getAllCountries(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if( snapshot.hasData){

              List<Country> countries = snapshot.data;

              return ListView.builder(
                  itemCount: countries.length,

                  itemBuilder: (BuildContext context, int index){

                    return Card(
                      color: Colors.amber[100],
                      child: Row(
                        spacing: 10,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 80,
                              child: SvgPicture.network(countries[index].flag!)),

                          Expanded(child: Text(countries[index].name!, style: TextStyle(fontSize: 24),)),
                        ],
                      ),
                    );

                  });

            }else{
              return Center(child: SpinKitSpinningLines(color: Colors.purple,),);
            }
          }),
    );
  }
}
