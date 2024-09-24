import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  String weatherData = '';
  
  void fetchWeather(){
    final city = controller.text;
     final random = Random();
    final temp = 15 + random.nextInt(15);
     final conditions = ['sunny', 'cloudy', 'rainy']; 
    final condition = conditions[random.nextInt(3)];

    setState(() {
      weatherData = 'Weather in $city: $temp C, $condition';
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller:controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a city',
                ),
              ),
              const SizedBox(height: 20), 
              ElevatedButton(
                onPressed: fetchWeather,
                child: const Text('Fetch Weather'),
              ),
              SizedBox(height: 20,),
              Text(weatherData)
            ],
          ),
        ),
      ),
    );
  }
}
