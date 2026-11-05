import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_care/core/cache/shared_preferences_helper.dart';
import 'package:tut_care/core/constans/const_key.dart';
import 'package:tut_care/core/router/route_names.dart';
import 'package:tut_care/core/secure_storage/secure_storage.dart';
import 'package:tut_care/utils/tut_care_method_helper.dart';
import 'global_intent.dart';
import 'global_state.dart';

@injectable
class GlobalCubit extends Cubit<GlobalState> {
  final SecureStorage _secureStorage;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  GlobalCubit(this._secureStorage, this._sharedPreferencesHelper)
      : super(GlobalInitial());
  String? redirectedScreen;
  late bool isArLanguage;
  late int languageSelectedIndex;

  Future<void> doIntent({required GlobalIntent intent}) async {
    switch (intent) {
      case GlobalInitializationIntent():
        await _onInit();
      case ChangeLanguageIntent():
        await _changedLanguageIndex(index: intent.index);
    }
  }

  Future<void> _onInit() async {
    _getSelectedLanguage();
    await _setRedirectedScreen();
  }

  void _getSelectedLanguage() {
    isArLanguage = _sharedPreferencesHelper.getBool(
      key: ConstKeys.isArLanguage,
    );
    languageSelectedIndex = isArLanguage ? 1 : 0;
  }

  Future<void> _setRedirectedScreen() async {
    final userToken = await _secureStorage.getData(key: ConstKeys.tokenKey);
    final isRemembered = _sharedPreferencesHelper.getBool(
      key: ConstKeys.rememberMe,
    );
    FlutterNativeSplash.remove();
    if (userToken != null && isRemembered) {
      TutCareMethodHelper.currentUserToken = userToken;
      redirectedScreen = RouteNames.tutCareBottomNavigation;
    } else {
      redirectedScreen = RouteNames.login;
    }
    emit(LoadedRedirectedScreen());
  }

  Future<void> _changedLanguageIndex({required int index}) async {
    if (languageSelectedIndex != index && index == 0) {
      languageSelectedIndex = index;
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: false,
      );
      isArLanguage = false;
      emit(ChangeLanguageIndexState());
    } else if (languageSelectedIndex != index && index == 1) {
      languageSelectedIndex = index;
      await _sharedPreferencesHelper.saveBool(
        key: ConstKeys.isArLanguage,
        value: true,
      );
      isArLanguage = true;
      emit(ChangeLanguageIndexState());
    }
  }
}