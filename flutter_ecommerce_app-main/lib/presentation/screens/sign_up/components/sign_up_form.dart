import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/form_messages.dart';
import 'package:store/domain/entites/register.dart';
import 'package:store/presentation/bloc/register/register_bloc.dart';
import 'package:store/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:store/presentation/widgets/custom_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameFormFieldKey = GlobalKey<FormFieldState>();
  final _emailFormFieldKey = GlobalKey<FormFieldState>();
  final _phoneNumberFormFieldKey = GlobalKey<FormFieldState>();
  final _passwordFormFieldKey = GlobalKey<FormFieldState>();
  final _confirmPasswordFormFieldKey = GlobalKey<FormFieldState>();
  String? username;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmedPassword;
  late FocusNode passwordFocusNode, confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            usernameFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            emailFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            phoneNumberFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            passwordFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            confirmPasswordFormField(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is FailureRegister) {
                  Fluttertoast.showToast(msg: state.errorMesage);
                }

                if (state is SuccessRegister) {
                  Fluttertoast.showToast(msg: "Berhasil Register");
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      SignInScreen.routeName, (route) => false);
                }
              },
              child: CustomButton(
                title: "Continue",
                backgroundColor: primaryColor,
                forgroundColor: Colors.white,
                width: MediaQuery.of(context).size.width * 0.85,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<RegisterBloc>().add(
                          EventRegister(
                            register: Register(
                                confirmPassword: confirmedPassword!,
                                email: email!,
                                handphone: phoneNumber!,
                                name: username!,
                                password: password!),
                          ),
                        );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailFormField() {
    return TextFormField(
      key: _emailFormFieldKey,
      onSaved: (newEmail) {
        setState(() {
          email = newEmail;
        });
      },
      onChanged: (newEmail) {
        _emailFormFieldKey.currentState!.validate();
      },
      onFieldSubmitted: (newEmail) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: Icon(Icons.email)),
      validator: (newEmail) {
        if (newEmail!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(newEmail)) {
          return kInvalidEmailError;
        }
        return null;
      },
    );
  }

  TextFormField passwordFormField() {
    return TextFormField(
      key: _passwordFormFieldKey,
      focusNode: passwordFocusNode,
      onChanged: (newPassword) {
        _passwordFormFieldKey.currentState!
            .validate(); // call passowrd field validator
        password = newPassword;
      },
      onFieldSubmitted: (newPassword) {
        confirmPasswordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: Icon(Icons.lock)),
      validator: (newPassword) {
        if (newPassword!.isEmpty) {
          return kPasswordNullError;
        } else if (newPassword.length < 8) {
          return kShortPasswordError;
        }
        return null;
      },
    );
  }

  TextFormField confirmPasswordFormField() {
    return TextFormField(
      key: _confirmPasswordFormFieldKey,
      focusNode: confirmPasswordFocusNode,
      onChanged: (newPassword) {
        _confirmPasswordFormFieldKey.currentState!
            .validate(); // call confirm passowrd field validator
        confirmedPassword = newPassword;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: false,
      decoration: const InputDecoration(
          labelText: "Confrim Password",
          hintText: "Re-Enter your password",
          suffixIcon: Icon(Icons.lock)),
      validator: (newPassword) {
        if (newPassword!.isEmpty) {
          return kPasswordNullError;
        } else if (newPassword != password) {
          return kPasswordMatchError;
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  TextFormField usernameFormField() {
    return TextFormField(
      key: _usernameFormFieldKey,
      onSaved: (newUsername) {
        setState(() {
          username = newUsername;
        });
      },
      onChanged: (newUsername) {
        _usernameFormFieldKey.currentState!.validate();
      },
      onFieldSubmitted: (newUsername) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          labelText: "Username",
          hintText: "Enter your name",
          suffixIcon: Icon(Icons.person)),
      validator: (newUsername) {
        if (newUsername!.isEmpty) {
          return kEmailNullError;
        } else if (!usernameValidatorRegExp.hasMatch(newUsername)) {
          return kInvalidUsernameError;
        }
        return null;
      },
    );
  }

  TextFormField phoneNumberFormField() {
    return TextFormField(
      key: _phoneNumberFormFieldKey,
      onSaved: (newPhoneNumber) {
        setState(() {
          phoneNumber = newPhoneNumber;
        });
      },
      onChanged: (newPhoneNumber) {
        _usernameFormFieldKey.currentState!.validate();
      },
      onFieldSubmitted: (newPhoneNumber) {
        passwordFocusNode.requestFocus();
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          suffixIcon: Icon(Icons.phone)),
      validator: (newPhoneNumber) {
        if (newPhoneNumber!.isEmpty) {
          return kPhoneNumberNullError;
        } else if (!phoneNumberValidatorRegExp.hasMatch(newPhoneNumber)) {
          return kValidPhoneNumberError;
        }
        return null;
      },
    );
  }
}

class ScreenArgs {
  final String username;
  final String email;
  final String password;
  const ScreenArgs(
      {required this.username, required this.email, required this.password});
}
