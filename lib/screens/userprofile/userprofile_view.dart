import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stetfit/controllers/user_controller.dart';
import 'package:stetfit/models/user.dart';
import 'package:stetfit/screens/login/widgets/userinput.dart';
import 'package:stetfit/screens/userprofile/userprofile_viewmodel.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = context.watch<UserController>();
    final user = userController.user as User;

    TextEditingController fullname = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController height = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController targetweight = TextEditingController();

    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fullname:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              UserInput(
                  hintTitle: user.fullname,
                  keyboardType: TextInputType.name,
                  password: false,
                  userInput: fullname),
              const Text(
                'Age:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              UserInput(
                  hintTitle: user.age.toString(),
                  keyboardType: TextInputType.number,
                  password: false,
                  userInput: age),
              const Text(
                'Height:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              UserInput(
                  hintTitle: user.height.toString(),
                  keyboardType: TextInputType.number,
                  password: false,
                  userInput: height),
              const Text(
                'Weight:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              UserInput(
                  hintTitle: user.weight.toString(),
                  keyboardType: TextInputType.number,
                  password: false,
                  userInput: weight),
              const Text(
                'Target Weight:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              UserInput(
                  hintTitle: user.targetweight.toString(),
                  keyboardType: TextInputType.number,
                  password: false,
                  userInput: targetweight),
              Container(
                alignment: Alignment.center,
                child: Consumer<UserProfileViewModel>(
                  builder: (context, viewmodel, _) => ElevatedButton(
                    onPressed: () async {
                      if (fullname.text.isNotEmpty) {
                        viewmodel.addIndex('fullname', fullname.text);
                      }
                      if (age.text.isNotEmpty) {
                        viewmodel.addIndex('age', int.parse(age.text));
                      }
                      if (height.text.isNotEmpty) {
                        viewmodel.addIndex('height', int.parse(height.text));
                      }
                      if (weight.text.isNotEmpty) {
                        viewmodel.addIndex('weight', int.parse(weight.text));
                      }
                      if (targetweight.text.isNotEmpty) {
                        viewmodel.addIndex(
                            'targetweight', int.parse(targetweight.text));
                      }

                      final response =
                          await viewmodel.updateUserProfile(user.id);
                      if (response == 1) {
                        if (fullname.text.isNotEmpty) {
                          userController.setFullName(fullname.text);
                        }
                        if (age.text.isNotEmpty) {
                          userController.setAge(int.parse(age.text));
                        }
                        if (height.text.isNotEmpty) {
                          userController.setHeight(int.parse(height.text));
                        }
                        if (weight.text.isNotEmpty) {
                          userController.setWeight(int.parse(weight.text));
                        }
                        if (targetweight.text.isNotEmpty) {
                          userController
                              .setTargetWeight(int.parse(targetweight.text));
                        }
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(246, 197, 190, 1))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
