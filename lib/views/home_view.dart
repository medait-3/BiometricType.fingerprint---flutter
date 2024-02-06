import 'package:flutter/material.dart';

import '../helpers/biometric_helper.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showBiometric = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showBiometric ?
              ElevatedButton(
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {});
                },
              ):Text("daa"),
            if (isAuthenticated)
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'its, Authenticated',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.greenAccent, fontSize: 25),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
