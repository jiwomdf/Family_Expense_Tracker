import 'package:family_expense_tracker/util/app_assets_util.dart';
import 'package:family_expense_tracker/util/ext/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileWidget extends StatelessWidget {
  final String userName;
  const ProfileWidget({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child:
              CircleAvatar(child: SvgPicture.asset(AppAssetsUtil.imgProfile)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: userName,
                    style: TextUtil(context).urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ))
              ])),
            ],
          ),
        ),
      ],
    );
  }
}
