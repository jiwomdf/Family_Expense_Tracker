import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/presentation/bloc/register/register_bloc.dart';
import 'package:family_expense_tracker/presentation/widget/text_form_field.dart';
import 'package:family_expense_tracker/util/app_snackbar_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register-page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "";
  String password = "";
  String confirmPassword = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            context.buildCircleDialog(true);
          } else if (state is RegisterHasData) {
            context.hideDialog();
            if (state.result) {
              context.showSb(
                  SnackBar(content: Text(S.of(context).loginSuccess)), true);
            } else {
              context.showSb(
                  SnackBar(
                      content:
                          Text(S.of(context).somethingWentWrongPleaseTryAgain)),
                  true);
            }
          } else if (state is RegisterError) {
            context.hideDialog();
            context.showSb(SnackBar(content: Text(state.message)), true);
          }
        },
        child: registerScreen(),
      ),
    ));
  }

  Widget registerScreen() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).getStarted,
                      style: TextUtil(context).urbanist(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(S.of(context).createYourAccountBelow,
                      style: TextUtil(context).urbanist(
                        fontSize: 16,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 10),
                    child: TextFormField(
                      decoration: textFormFieldStyle(
                          context: context,
                          hintText: S.of(context).enterYourEmail),
                      validator: (String? val) => (val?.isEmpty ?? true)
                          ? S.of(context).enterAnEmail
                          : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: textFormFieldStyle(
                          context: context,
                          hintText: S.of(context).enterYourPassword),
                      obscureText: true,
                      validator: (val) => (val?.length ?? 0) < 6
                          ? S.of(context).enterAPassword6CharsLong
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                  ),
                  TextFormField(
                    decoration: textFormFieldStyle(
                        context: context,
                        hintText: S.of(context).confirmYourPassword),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => confirmPassword = val);
                    },
                    validator: (val) => (val != password)
                        ? S.of(context).confirmPasswordIsNotSameAsPassword
                        : null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            context
                                .read<RegisterBloc>()
                                .add(GetRegisterEvent(email, password));
                          }
                        },
                        child: Text(
                          S.of(context).createAccount,
                          style: TextUtil(context).urbanist(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Text(
                                S.of(context).alreadyHaveAccount,
                                style: TextUtil(context).urbanist(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
