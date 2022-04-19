import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/homescreen/Dashboard.dart';
import 'package:stetfit/screens/login/login_viewmodel.dart';

import '../login/widgets/userinput.dart';
import '../login/widgets/login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  final emailController = TextEditingController();
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
              height: 510,
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
                    const SizedBox(height: 45),
                    UserInput(
                        keyboardType: TextInputType.emailAddress,
                        hintTitle: 'Email',
                        userInput: emailController),
                    UserInput(
                        userInput: passwordController,
                        hintTitle: 'Password',
                        keyboardType: TextInputType.visiblePassword),
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
                          onPressed: () async{
                            // Provider.of<Auth>(context, listen: false).login(emailController.text, passwordController.text);
                            final user = await viewmodel.login(
                                username: emailController.text,
                                password: passwordController.text);
                            Navigator.pushNamed(
                                context, DashboardScreen.routeName,
                                arguments: user);
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
                    const Center(
                      child: Text('Forgot password ?'),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Login(icon: Icons.add),
                          Login(icon: Icons.book_online),
                        ],
                      ),
                    ),
                    const Divider(thickness: 0, color: Colors.white),
                    /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text('Don\'t have an account yet ? ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                    TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  ],
                ),
                  */
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
