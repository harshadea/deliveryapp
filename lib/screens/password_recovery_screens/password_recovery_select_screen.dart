import 'package:ecomikdeliveryapp/models/enums.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_constants.dart';
import 'package:ecomikdeliveryapp/utils/constants/app_page_names.dart';
import 'package:ecomikdeliveryapp/widgets/core_widgets.dart';
import 'package:ecomikdeliveryapp/widgets/screen_widgets/password_recovery_select_screen_widgets.dart';
import 'package:flutter/material.dart';

class PasswordRecoverySelectScreen extends StatefulWidget {
  const PasswordRecoverySelectScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoverySelectScreen> createState() =>
      _PasswordRecoverySelectScreenState();
}

class _PasswordRecoverySelectScreenState
    extends State<PasswordRecoverySelectScreen> {
  /// Reset password choice
  ResetPasswordSelectedChoice _currentlySelectedChoice =
      ResetPasswordSelectedChoice.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Empty appbar with back button --------> */
      appBar: CoreWidgets.appBarWidget(screenContext: context),
      /* <-------- Content --------> */
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppGaps.screenPaddingValue),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top extra spaces
                AppGaps.hGap80,
                /* <---- Verification icon and text ----> */
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppGaps.hGap20,
                      Text('Reset your password',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3),
                      AppGaps.hGap16,
                      Text(
                          'Verification code was sent to your number. '
                          'Which is +880 (238) 282 982',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color: AppColors.bodyTextColor,
                                  overflow: TextOverflow.clip)),
                    ],
                  ),
                ),
                AppGaps.hGap40,
                /* <---- Email option select ----> */
                Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectResetPasswordWidget(
                      titleText: 'Send to your mail',
                      contentText:
                          'Password reset link has been sent to your mail',
                      isSelected: _currentlySelectedChoice ==
                          ResetPasswordSelectedChoice.mail,
                      currentSelectedRadioValue:
                          ResetPasswordSelectedChoice.mail,
                      groupRadioValue: _currentlySelectedChoice,
                      localSVGIconName: AppAssetImages.messageSVGLogoLine,
                      onTap: () => setState(() => _currentlySelectedChoice =
                          ResetPasswordSelectedChoice.mail),
                    ),
                    AppGaps.hGap24,
                    SelectResetPasswordWidget(
                      titleText: 'Send to your phone number',
                      contentText:
                          'Password reset link has been sent to your phone number',
                      currentSelectedRadioValue:
                          ResetPasswordSelectedChoice.phoneNumber,
                      groupRadioValue: _currentlySelectedChoice,
                      isSelected: _currentlySelectedChoice ==
                          ResetPasswordSelectedChoice.phoneNumber,
                      localSVGIconName: AppAssetImages.phoneSVGLogoLine,
                      onTap: () => setState(() => _currentlySelectedChoice =
                          ResetPasswordSelectedChoice.phoneNumber),
                    ),
                  ],
                )),
                AppGaps.hGap30,
              ],
            ),
          ),
        ),
      ),
      /* <-------- Bottom bar of sign up text --------> */
      bottomNavigationBar: CustomScaffoldBottomBarWidget(
        child: CustomStretchedTextButtonWidget(
            buttonText: 'Reset password',
            onTap: _currentlySelectedChoice == ResetPasswordSelectedChoice.none
                ? null
                : () {
                    Navigator.pushNamed(context,
                        AppPageNames.passwordRecoveryVerificationScreen);
                  }),
      ),
    );
  }
}
