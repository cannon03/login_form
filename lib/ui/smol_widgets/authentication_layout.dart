import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:login_form/ui/common/app_colors.dart';
import 'package:login_form/ui/common/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;

  final String mainButtonTitle;
  final Widget form;

  final bool showTermsText;
  final void Function() onMainButtonTapped;

  final void Function()? onCReateAccountTapped;

  final void Function()? onForgetPasswordTapped;

  final void Function()? onBackPressed;

  final String validationMessage;

  final bool busy;

  const AuthenticationLayout({
    required this.title,
    required this.subtitle,
    required this.form,
    required this.onMainButtonTapped,
    this.validationMessage = 'HELLO',
    this.busy = false,
    this.mainButtonTitle = 'CONTNIUE',
    this.onBackPressed,
    this.onCReateAccountTapped,
    this.onForgetPasswordTapped,
    this.showTermsText = false,
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceMedium,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBackPressed,
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.7),
            child: Text(
              subtitle,
              style: ktsMediumGreyBodyText,
            ),
          ),
          form,
          verticalSpaceMedium,
          if (onForgetPasswordTapped != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgetPasswordTapped,
                child: Text(
                  'Forgot password',
                  style: ktsMediumGreyBodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Text(
            validationMessage,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(0),
              ),
              child: busy
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(
                      mainButtonTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
            ),
          ),
          verticalSpaceMedium,
          if (onCReateAccountTapped != null)
            GestureDetector(
              onTap: onCReateAccountTapped,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(color: kcPrimaryColor),
                  )
                ],
              ),
            ),
          if (showTermsText)
            const Text(
              'By signing up you agree to our policy',
              style: ktsMediumGreyBodyText,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
