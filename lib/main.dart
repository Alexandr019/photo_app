import 'package:flutter/material.dart';
import 'package:photo_app/image_page.dart';

const List<String> _list = [
  'assets/180099930.jpg',
  'assets/Broadway,-New-York_GettyImages-588653038.webp',
  'assets/new-york-city-evening-NYCTG0221.jpg',
  'assets/newyork_city.jpg',
  'assets/nueva-york-quinta-avenida_0.jpg'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ImagePage.routeName: (context) =>
        const ImagePage(),
      },
        onGenerateRoute: (settings) {
          // If you push the PassArguments route
          if (settings.name == PassArgumentsScreen.routeName) {
            // Cast the arguments to the correct
            // type: ScreenArguments.
            final args = settings.arguments as ScreenArguments;

            // Then, extract the required data from
            // the arguments and pass the data to the
            // correct screen.
            return MaterialPageRoute(
              builder: (context) {
                return PassArgumentsScreen(
                  title: args.title,
                  message: args.message,
                );
              },
            );
          }
        },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Photo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (final imagePath in _list) {
      widgets.add(buildImageWidget(imagePath));
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Photo",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              ...widgets,
            ],
          ),
        ],
      ),
    );
  }

  InkWell buildImageWidget(String imagePath) {
    return InkWell(
        child: Padding(
            padding: const EdgeInsets.all(5.0), child: Image.asset(imagePath)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const ImagePage();
            }),
          );
        });
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}