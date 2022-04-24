import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/screens/homescreen/homescreen_view.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';

import '../login/widgets/userinput.dart';
import 'widgets/signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              height: 173,
              child: Image.asset(
                'assets/images/StetFit-logos.jpeg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: 490,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text('Login With Your Credentials :',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 15),
                    UserInput(
                      keyboardType: TextInputType.emailAddress,
                      hintTitle: 'Username',
                      userInput: usernameController,
                      password: false,
                    ),
                    UserInput(
                      userInput: passwordController,
                      hintTitle: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      password: true,
                    ),
                    Container(
                      height: 55,
                      // for an exact replicate, remove the padding.
                      // pour une réplique exact, enlever le padding.
                      padding:
                          const EdgeInsets.only(top: 5, left: 70, right: 70),
                      child: Consumer<LoginViewModel>(
                          builder: (context, viewmodel, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(246, 197, 190, 1))),
                          onPressed: () async {
                            final user = await viewmodel.login(
                                username: usernameController.text,
                                password: passwordController.text);

                            Navigator.of(context).pushReplacementNamed(
                              HomeScreen.routeName,
                              arguments: user,
                            );
                            // Navigator.pushReplacementNamed(
                            //     context, HomeScreen.routeName,
                            //     arguments: user);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          SignUp(icon: Icons.add),
                        ],
                      ),
                    ),
                    const Divider(thickness: 0, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
