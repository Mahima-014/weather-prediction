import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:climate/services/weather.dart';





class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocationData() async{
    var weatherData= await WeatherModel().getLocationWeather();

   Navigator.push(context, MaterialPageRoute(builder: (context){
     return LocationScreen(locationWeather: weatherData);
   }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/0.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
