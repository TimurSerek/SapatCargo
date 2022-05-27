import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sapat_cargo_api/domain/api_clients/api_client.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _client = ApiClient();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  String password = 'password';

  void register() async {
    final asfd = await _client.registerUser(
      phoneNumberController.text.trim(),
      passwordController.text.trim(),
      emailController.text.trim(),
    );

    setState(() {
      password = asfd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(password),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  register();
                  //  openDialog();
                },
                child: const Text('Register'),
              )
            ],
          ),
        ));
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Enter code'),
              content: TextField(
                controller: codeController,
                decoration: InputDecoration(
                  hintText: 'Enter code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _client.verifyCode(
                      codeController.text.trim(),
                      phoneNumberController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  child: const Text('Send code'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                )
              ],
            ));
  }
}
