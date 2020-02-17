import 'package:flutter/material.dart';
import 'EligibilityScreenProvider.dart';
import 'package:provider/provider.dart';

class EligibilityScreen extends StatelessWidget {
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EligibilityScreenProvider>(
      create: (context) => EligibilityScreenProvider(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Consumer<EligibilityScreenProvider>(
                  builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (provider.isEligible == null)
                              ? Colors.orangeAccent
                              : provider.isEligible
                                  ? Colors.green
                                  : Colors.red),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(
                        hintText: 'Give Your Age',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          final int age = int.parse(ageController.text.trim());

                          provider.checkEligbility(age);
                        },
                        child: Text(
                          "Check",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      provider.eligibilityMessage,
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}
