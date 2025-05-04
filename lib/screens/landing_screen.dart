
import 'package:flutter/material.dart';
import 'package:uoajk_day5/screens/country_list_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landing Screen"),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),

      body: ListView(
        children: [

          Card(

            color: Colors.amber[100],
            child: ListTile(
              leading: Text('1'),
              title: Text('Countries Flag API'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return CountryListScreen();
                }));
              },
            ),
          ),

          Card(
            color: Colors.amber[100],
            child: ListTile(
              leading: Text('2'),
              title: Text('Products API'),
              onTap: (){},
            ),
          ),
        ],
      ),

    );
  }
}
