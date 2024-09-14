import 'package:family_expense_tracker/generated/l10n.dart';
import 'package:family_expense_tracker/main.dart';
import 'package:family_expense_tracker/presentation/bloc/logout/logout_bloc.dart';
import 'package:family_expense_tracker/presentation/bloc/usermodel/userdatamodel_bloc.dart';
import 'package:family_expense_tracker/presentation/page/export_expense/export_expense_page.dart';
import 'package:family_expense_tracker/presentation/page/home/widget/profile_widget.dart';
import 'package:family_expense_tracker/presentation/page/import_expense/import_expense_page.dart';
import 'package:family_expense_tracker/presentation/page/update_table/update_table_page.dart';
import 'package:family_expense_tracker/util/app_color_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightDrawer extends StatefulWidget {
  const RightDrawer({super.key});

  @override
  State<RightDrawer> createState() => _RightDrawerState();
}

class _RightDrawerState extends State<RightDrawer> {
  String username = "";
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    context.read<UserDataModelBloc>().add(const GetUserDataModelEvent());
    isLight = MyApp.of(context).isLightMode();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: BlocBuilder<UserDataModelBloc, UserDataModelState>(
            builder: (context, state) {
          if (state is UserDataModelLoading) {
            const Center(child: CircularProgressIndicator());
          } else if (state is UserDataModelHasData) {
            username = state.result.getDisplayName();
          } else if (state is UserDataModelError) {}

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topDrawer(),
                  switcher(context),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    exportData(context),
                    importData(context),
                    updateTable(context),
                    logout(context),
                    version(context)
                  ],
                ),
              )
            ],
          );
        }));
  }

  Container topDrawer() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
              Color.fromARGB(255, 132, 156, 242),
              Color(0xFF00968a)
            ]),
      ),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: ProfileWidget(userName: username),
    );
  }

  Padding importData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ImportExpensePage.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(Icons.file_upload),
              ),
              Text(S.of(context).importData,
                  style: TextUtil(context)
                      .urbanist(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Padding exportData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ExportExpensePage.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(Icons.sd_storage_rounded),
              ),
              Text("Export Data",
                  style: TextUtil(context)
                      .urbanist(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget switcher(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Switch(
          activeTrackColor: AppColors.purple.purpleGradienVideo,
          inactiveTrackColor: AppColors.purple.purpleDarker,
          activeColor: isLight
              ? AppColors.purple.purpleSoftLight
              : AppColors.purple.purpleSoftLight,
          value: isLight,
          onChanged: (value) {
            setState(() {
              isLight = value;
              if (isLight) {
                MyApp.of(context).changeTheme(ThemeMode.light);
              } else {
                MyApp.of(context).changeTheme(ThemeMode.dark);
              }
            });
          }),
    );
  }

  Padding logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, left: 10),
      child: InkWell(
        onTap: () {
          context.read<LogoutBloc>().add(const GetLogoutEvent());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.logout, color: AppColors.red.primary),
              ),
              Text("Logout",
                  style: TextUtil(context).urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.red.primary)),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, UpdateTablePage.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(Icons.update),
              ),
              Text("Update Scheme",
                  style: TextUtil(context)
                      .urbanist(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }

  Widget version(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Version 1.1.0",
          style: TextStyle(color: AppColors.grey.lightGray),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
