import 'package:flutter/material.dart';
import 'package:villages/shared/data/Client/user_auth.dart';
import 'package:villages/views/edit_password/edit_password.dart';
import 'package:villages/views/edit_phone_num/edit_phone_num.dart';
import 'package:villages/views/edit_profile/edit_profile.dart';
import 'package:villages/views/login_view/login_view.dart';
import 'package:villages/views/reset_password/add_new_password.dart';
import 'package:villages/views/reset_password/reset_password_view.dart';
import 'package:villages/views/reset_password/verfiy_view.dart';
import 'package:villages/views/sign_up_view/sign_up_view.dart';
import 'package:villages/views/village_hospital/village_hospital_page.dart';
import 'package:villages/views/welcoming/splash_screen.dart';
import 'package:villages/views/welcoming/welcome_screen.dart';

import '../shared/constants/constant.dart';
import '../shared/views/layouts/super_market/super_market_page.dart';
import '../views/app_helping/app_helping_view.dart';
import '../views/blank/blank_page.dart';
import '../views/connect_with_us/connect_with_us_view.dart';
import '../views/educational_services/educational_services_view.dart';
import '../views/emergency/emergency_view.dart';
import '../views/know_more_au/know_more_au_view.dart';
import '../views/medical_services/medical_services_view.dart';
import '../views/notification/notification_view.dart';
import '../views/village_services_screen/village_services_screen.dart';
import '../views/village_main_screen/village_main_screen_view.dart';
import '../views/social_services/social_services_view.dart';
import '../views/spcial_doctors/spcial_doctors_view.dart';
import '../views/sport_club/sport_club_view.dart';
import '../views/village_re/village_review.dart';
import '../views/village_workers/village_workers_view.dart';

enum WorkrsTypes {
  teacher,
  worker,
  hospital,
  shop,
  clinic,
}

class AppRouter {
  static const String splashScreen = '/';
  static const String welcomeScreen = '/welcome';
  static const String signUpView = '/signUp';
  static const String loginView = '/login';
  static const String editPhoneNum = '/editPhoneNum';
  static const String editProfileView = '/editProfile';
  static const String resetPasswordView = '/resetPassword';
  static const String editPasswordView = '/editPassword';
  static const String addNewPassword = '/addNewPassword';
  static const String verifyView = '/verify';
  static const String sportClubPage = '/sportClub';
  static const String villageReviewScreen = '/villageReview';
  static const String servicesMainScreen = '/servicesMain';
  static const String villageServicesScreen = '/villageservicesscreen';
  static const String educationalServicesScreen = '/educationalServices';
  static const String medicalServicesScreen = '/medicalServices';
  static const String socialServicesScreen = '/socialServices';
  static const String villageWorkersScreen = '/villageWorkers';
  static const String emergencyPage = '/emergency';
  static const String notificationPage = '/notification';
  static const String spcialDoctorsPage = '/spcialDoctors';
  static const String villageHospitalPage = '/villageHospital';
  static const String appHelpingPage = '/appHelping';
  static const String knowMoreAUPage = '/knowMoreAU';
  static const String connectWithUsPage = '/connectWithUs';
  static const String blankPage = '/blankPage';

  static toWorkerByName(BuildContext ctx, String name) {
    switch (name) {
      case "teacher":
        break;
      case "worker":
        Navigator.of(ctx).pushNamed(villageWorkersScreen);
        break;
      case "hospital":
        Navigator.of(ctx).pushNamed(villageHospitalPage);
        break;
      case "shop":
        Navigator.of(ctx).pushNamed(blankPage);
        break;
      case "clinic":
        Navigator.of(ctx).pushNamed(
          AppRouter.spcialDoctorsPage,
        );
        break;

      default:
        Navigator.of(ctx).pushNamed(blankPage);
    }
  }

  static toServiceByName(BuildContext ctx, String name) {
    switch (name) {
      case hospitalString:
        Navigator.of(ctx).pushNamed(villageHospitalPage);
        break;
      case schoolString:
        Navigator.of(ctx).pushNamed(educationalServicesScreen);
        break;
      case factoiesString:
        Navigator.of(ctx).pushNamed(blankPage);
        break;
      case jobsAndCraftString:
        Navigator.of(ctx).pushNamed(villageWorkersScreen);
        break;
      case clinicsString:
        Navigator.of(ctx).pushNamed(medicalServicesScreen);
        break;
      case emrgancyString:
        Navigator.of(ctx).pushNamed(emergencyPage);
        break;
      case 'المحالات التجارية':
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (_) => const SuperMarketPage(),
          ),
        );
        break;
    }
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var auth = UserAuth.i;
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => auth.token == ''
              ? const SplashScreen()
              : const VillageMainScreen(),
          settings: settings,
        );
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
          settings: settings,
        );
      case signUpView:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
          settings: settings,
        );
      case loginView:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
          settings: settings,
        );
      case blankPage:
        return MaterialPageRoute(
          builder: (_) => const BlankPage(),
          settings: settings,
        );
      case editPhoneNum:
        return MaterialPageRoute(
          builder: (_) => const EditPhoneNum(),
          settings: settings,
        );
      case editProfileView:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
          settings: settings,
        );
      case resetPasswordView:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
          settings: settings,
        );
      case editPasswordView:
        return MaterialPageRoute(
          builder: (_) => const EditPasswordView(),
          settings: settings,
        );
      case addNewPassword:
        return MaterialPageRoute(
          builder: (_) => const AddNewPassword(),
          settings: settings,
        );
      case verifyView:
        return MaterialPageRoute(
          builder: (_) => const VerifyView(),
          settings: settings,
        );
      case sportClubPage:
        return MaterialPageRoute(
          builder: (_) => const SportClubPage(),
          settings: settings,
        );
      case villageReviewScreen:
        return MaterialPageRoute(
          builder: (_) => const VillageReviewScreen(),
          settings: settings,
        );
      case servicesMainScreen:
        return MaterialPageRoute(
          builder: (_) => const VillageMainScreen(),
          settings: settings,
        );
      case villageServicesScreen:
        return MaterialPageRoute(
          builder: (_) => const VillageServicesScreen(),
          settings: settings,
        );
      case educationalServicesScreen:
        return MaterialPageRoute(
          builder: (_) => const EducationalServicesScreen(),
          settings: settings,
        );
      case medicalServicesScreen:
        return MaterialPageRoute(
          builder: (_) => const MedicalServicesScreen(),
          settings: settings,
        );
      case socialServicesScreen:
        return MaterialPageRoute(
          builder: (_) => const SocialServicesScreen(),
          settings: settings,
        );
      case villageWorkersScreen:
        return MaterialPageRoute(
          builder: (_) => const VillageWorkersScreen(),
          settings: settings,
        );
      case emergencyPage:
        return MaterialPageRoute(
          builder: (_) => const EmergencyPage(),
          settings: settings,
        );
      case notificationPage:
        return MaterialPageRoute(
          builder: (_) => const NotificationPage(),
          settings: settings,
        );
      case spcialDoctorsPage:
        return MaterialPageRoute(
          builder: (_) => const SpcialDoctorsPage(),
          settings: settings,
        );
      case villageHospitalPage:
        return MaterialPageRoute(
          builder: (_) => const VillageHospitalPage(),
          settings: settings,
        );
      case appHelpingPage:
        return MaterialPageRoute(
          builder: (_) => const AppHelpingPage(),
          settings: settings,
        );
      case knowMoreAUPage:
        return MaterialPageRoute(
          builder: (_) => const KnowMoreAUPage(),
          settings: settings,
        );
      case connectWithUsPage:
        return MaterialPageRoute(
          builder: (_) => const ConnectWithUsPage(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
