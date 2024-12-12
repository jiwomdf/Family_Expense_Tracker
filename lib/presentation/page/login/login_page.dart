import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_expense_tracker/di/bloc_injection.dart' as di;
import 'package:group_expense_tracker/generated/l10n.dart';
import 'package:group_expense_tracker/presentation/bloc/login/login_bloc.dart';
import 'package:group_expense_tracker/presentation/page/register/register_page.dart';
import 'package:group_expense_tracker/presentation/widget/text_form_field.dart';
import 'package:group_expense_tracker/util/ext/text_util.dart';
import 'package:group_expense_tracker/util/style/app_assets_util.dart';
import 'package:group_expense_tracker/util/style/app_snackbar_util.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => di.locator<LoginBloc>(),
      dispose: (context, bloc) => bloc.close(),
      builder: (context, child) {
        return Scaffold(
            body: SafeArea(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                context.buildCircleDialog(true);
              } else if (state is LoginHasData) {
                context.hideDialog();
                context.showSb(
                  SnackBar(
                      content:
                          Text("${state.result.email} ${state.result.name}")),
                  true,
                );
              } else if (state is LoginError) {
                context.hideDialog();
                context.showSb(SnackBar(content: Text(state.message)), true);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  loginScreen(context),
                  SvgPicture.asset(AppAssetsUtil.imgGroup, height: 200),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  Widget loginScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(S.of(context).welcomeBack,
                          style: TextUtil(context).urbanist(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      GestureDetector(
                        child: const Icon(Icons.settings),
                        onTap: () => {
                          /** WidgetsBinding.instance.addPostFrameCallback((_) {
                            //await preferences.clear();
                            Phoenix.rebirth(context);
                          }) **/
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        S
                            .of(context)
                            .welcomeToGroupExpenseTrackerThisAppIsDesignedTo,
                        style: TextUtil(context).urbanist(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(S.of(context).loginToAccessYourAccountBelow,
                        style: TextUtil(context).urbanist(
                          fontSize: 16,
                        )),
                  ),
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
                        setState(() => _email = val);
                      },
                    ),
                  ),
                  TextFormField(
                    decoration: textFormFieldStyle(
                        context: context,
                        hintText: S.of(context).enterYourPassword),
                    obscureText: true,
                    validator: (val) => (val?.length ?? 0) < 6
                        ? S.of(context).enterAPassword6CharsLong
                        : null,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).forgetPassword),
                        OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() == true) {
                              context
                                  .read<LoginBloc>()
                                  .add(GetLoginEvent(_email, _password));
                            }
                          },
                          child: Text(S.of(context).login,
                              style: TextUtil(context).urbanist(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(S.of(context).dontHaveAnAccount),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _email = "";
                                  _password = "";
                                });
                                Navigator.pushNamed(
                                    context, RegisterPage.routeName);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(S.of(context).create,
                                    style: TextUtil(context).urbanist(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
