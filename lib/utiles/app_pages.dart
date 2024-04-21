
import 'package:fitpage/fitpageList_screen/fitpage_binding.dart';
import 'package:fitpage/fitpage_details/fitpage_details_binding.dart';
import 'package:fitpage/fitpagevalue_details/fitpagevalue_binding.dart';
import 'package:fitpage/utiles/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../fitpageList_screen/fitpage_screen.dart';
import '../fitpage_details/fitpage_details_screen.dart';
import '../fitpagevalue_details/fitpagevalue_screen.dart';

class AppPages{
  static const initialRoute = AppRoutes.fitPageScreen;
  static final routes = [
    GetPage(name: AppRoutes.fitPageScreen, page: () =>  FitPageScreen(), binding: FitpageBinding()),
    GetPage(name: AppRoutes.fitPageDetailsScreen, page: () =>  FitPageDetails(), binding: FitPageDetailsBinding()),
    GetPage(name: AppRoutes.fitPageValueDetailsScreen, page: () =>  FitpageValueScreen(), binding: FitpageValueBinding()),
  ];

}