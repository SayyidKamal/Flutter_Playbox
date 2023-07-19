import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroPage extends StatelessWidget {
  void navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'sign')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlutterLogo(
              size: 150.0,
            ),
            SizedBox(height: 50.0),
            Text(
              'Famnet',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'A platform built to connect with family',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.0),

            ElevatedButton(
              onPressed: () { navigateToLoginPage(context); },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started', // Replace with your desired button text
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios), // Replace with the desired icon
                ],
              ),
            ),
          ],
        ),
      ),
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
  int _counter = 0;

  bool _obscureText = true;

  void navigateToMainPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0,8,20.0,8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 80),
              const Text(
                'Famnet',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.0),
              const Text(
                'Family at your fingertips',
                style: TextStyle(fontSize: 18,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _obscureText,
              ),
              SizedBox(height: 30.0),

              ElevatedButton(
                onPressed: (){navigateToMainPage(context);},
                child: Row(
                  children: [
                    Expanded(
                        child: Align (
                            child: Text('Continue'),
                        )
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                style: ButtonStyle(),
                
              ),

              SizedBox(height: 15.0),

              const Text(
                'or',
                style: TextStyle(fontSize: 15,),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 15.0),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(fit: BoxFit.cover, height: 15, image: AssetImage("images/google_logo.png"),),
                      SizedBox(width: 7.0),
                      Text('Continue with Google'),
                    ],
                  ),
                  style: ButtonStyle(),
                ),
              ),

              SizedBox(height: 15.0),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(fit: BoxFit.cover, height: 15, image: AssetImage("images/apple_logo.png"),),
                      SizedBox(width: 7.0),
                      Text('Continue with Apple'),
                    ],
                  ),
                  style: ButtonStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Container(

        child: Center(
          child: Text(
            'Welcome to the Main Page',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrange,
        fixedColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: 'Family Tree',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
