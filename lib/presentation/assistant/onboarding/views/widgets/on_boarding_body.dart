import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tut_care/core/constants/app_icons.dart';
import 'package:tut_care/core/constants/app_text.dart';
import 'package:tut_care/core/router/route_names.dart';
import 'package:tut_care/presentation/assistant/onboarding/views/widgets/assistant_car_row.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_cubit.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_intent.dart';
import 'package:tut_care/presentation/assistant/onboarding/views_model/assistant_onboarding_state.dart';
import 'package:tut_care/utils/common_widgets/custom_card.dart';
import 'package:tut_care/utils/common_widgets/custom_elevated_button.dart';
import 'package:tut_care/utils/loaders/loaders.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = BlocProvider.of<AssistantOnboardingCubit>(context);

    return BlocConsumer<AssistantOnboardingCubit, AssistantOnboardingState>(
      listener: (context, state) {
        switch (state.effect) {
          case OnboardingEffect.validationError:
            Loaders.showWarningMessage(
              context: context,
              message: AppText.pleaseSelectAtLeastOneService,
            );

            cubit.resetEffect();
            break;

          case OnboardingEffect.navigateToVerification:
            cubit.resetEffect();
            Navigator.of(
              context,
            ).pushNamed(RouteNames.verifyIdentityView, arguments: cubit);
            break;

          case OnboardingEffect.none:
            break;

          case OnboardingEffect.documentTooLarge:
            break;
          case OnboardingEffect.navigateToVerificationStatus:
          break;
        }
      },
      builder: (context, state) {
        return RPadding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RSizedBox(height: 16),
                Text(
                  AppText.chooseAllThatApplyClientsOnlySeeRequestsYouCanDo.tr(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge,
                ),
                RSizedBox(height: 16),

                CustomCard(
                  title: AppText.visualGuidance.tr(),
                  subtitle: AppText.readingFindingPlacesShopping.tr(),
                  icon: AppIcons.eye,
                  isSelected: state.selectedServices.contains(
                    AssistantServiceType.visualGuidance,
                  ),
                  onTap: () {
                    cubit.doIntent(
                      intent: ToggleServiceIntent(
                        service: AssistantServiceType.visualGuidance,
                      ),
                    );
                  },
                ),
                RSizedBox(height: 16),

                CustomCard(
                  title: AppText.mobilityAssistance.tr(),
                  subtitle: AppText.gettingAroundTransfersCarrying.tr(),
                  icon: AppIcons.wheelchair,
                  isSelected: state.selectedServices.contains(
                    AssistantServiceType.mobilityAssistance,
                  ),
                  onTap: () {
                    cubit.doIntent(
                      intent: ToggleServiceIntent(
                        service: AssistantServiceType.mobilityAssistance,
                      ),
                    );
                  },
                ),
                RSizedBox(height: 16),
                CustomCard(
                  title: AppText.comprehensiveSupport.tr(),
                  subtitle: AppText.longerTasksCombiningBoth.tr(),
                  icon: AppIcons.users,
                  isSelected: state.selectedServices.contains(
                    AssistantServiceType.comprehensiveSupport,
                  ),
                  onTap: () {
                    cubit.doIntent(
                      intent: ToggleServiceIntent(
                        service: AssistantServiceType.comprehensiveSupport,
                      ),
                    );
                  },
                ),
                RSizedBox(height: 16),
                CarOptionWidget(
                  isSelected: state.hasCar,
                  onTap: () {
                    cubit.doIntent(intent: ToggleCarIntent());
                  },
                ),
                RSizedBox(height: 24),
                Divider(thickness: 3),
                RSizedBox(height: 10),

                CustomElevatedButton(
                  onPressed: () {
                    cubit.doIntent(intent: NextButtonPressedIntent());
                  },
                  buttonTitle: AppText.next,
                ),
                RSizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
