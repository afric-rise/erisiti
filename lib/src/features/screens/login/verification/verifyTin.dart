import 'package:erisiti/src/features/screens/login/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/styles/style.dart';
import '../bloc/login_bloc.dart';

class VerifyTinNumber extends StatefulWidget {
  const VerifyTinNumber({super.key});

  @override
  State<VerifyTinNumber> createState() => _VerifyTinNumberState();
}

class _VerifyTinNumberState extends State<VerifyTinNumber> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  var tinNumberValid;
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: loginBloc,
        builder: (context, state) {
          if (state is ValidateLoginTinNumberState) {
            tinNumberValid = state.valid;
            print("current state is ${state.valid}");
          }
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SvgPicture.asset(
                      "assets/images/undraw_questions_re_1fy7.svg",
                      semanticsLabel: "gift",
                      width: 220,
                      height: 220,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Please answer the following security questions ",
                            style: ApplicationStyles.getStyle(true, 18, null),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 15, right: 8, bottom: 8),
                        child: Center(
                          child: Text(
                            "What's your ? ",
                            style: ApplicationStyles.getStyle(true, 16, null),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Tin Number',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 8),
                        child: TextField(
                          onChanged: (value) {
                            loginBloc.add(ValidateLoginTinNumberEvent(value));
                          },
                          keyboardType: TextInputType.number,
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: tinNumberValid == null
                                ? null
                                : tinNumberValid!
                                    ? const Icon(
                                        Icons.check,
                                        color: ApplicationStyles.realAppColor,
                                        size: 15,
                                      )
                                    : const Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                            contentPadding: const EdgeInsets.only(left: 600.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                    color: tinNumberValid != null
                                        ? !tinNumberValid!
                                            ? Colors.red
                                            : ApplicationStyles.realAppColor
                                        : ApplicationStyles.realAppColor,
                                    width: 3)),
                            hintText: ' your input here',
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                    color: tinNumberValid != null
                                        ? !tinNumberValid!
                                            ? Colors.red
                                            : ApplicationStyles.realAppColor
                                        : ApplicationStyles.realAppColor,
                                    width: 3)),
                            prefixIcon: Container(
                              width: 30,
                              height: 50,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                border: tinNumberValid != null
                                    ? tinNumberValid!
                                        ? null
                                        : Border.all(color: Colors.red)
                                    : null,
                                color: ApplicationStyles.realAppColor,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0)),
                              ),
                              child: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Mother's surname",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 8),
                        child: TextField(
                          controller: _repeatPasswordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 600.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: ApplicationStyles.realAppColor,
                                    width: 3)),
                            hintText: ' your input here',
                            border: const OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color: ApplicationStyles.realAppColor,
                                    width: 3)),
                            prefixIcon: Container(
                              width: 30,
                              height: 50,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: const BoxDecoration(
                                color: ApplicationStyles.realAppColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0)),
                              ),
                              child: const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: ApplicationStyles.realAppColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'NEXT',
                            style: ApplicationStyles.getStyle(
                                true, 15, Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
