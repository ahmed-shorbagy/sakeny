// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get Login {
    return Intl.message(
      'Log in',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get singUp {
    return Intl.message(
      'Sign Up',
      name: 'singUp',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Tell us about yourself`
  String get tellUsAboutYourSelf {
    return Intl.message(
      'Tell us about yourself',
      name: 'tellUsAboutYourSelf',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Your Mobile phone number`
  String get yourmobile {
    return Intl.message(
      'Your Mobile phone number',
      name: 'yourmobile',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for registering`
  String get thankYouForRegistering {
    return Intl.message(
      'Thank you for registering',
      name: 'thankYouForRegistering',
      desc: '',
      args: [],
    );
  }

  /// `Your Request has been sent successfully`
  String get YourRequesthasbeensentsuccessfully {
    return Intl.message(
      'Your Request has been sent successfully',
      name: 'YourRequesthasbeensentsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `you will be contacted soon`
  String get youwillbecontactedsoon {
    return Intl.message(
      'you will be contacted soon',
      name: 'youwillbecontactedsoon',
      desc: '',
      args: [],
    );
  }

  /// `Continue To Home`
  String get ContinueToHome {
    return Intl.message(
      'Continue To Home',
      name: 'ContinueToHome',
      desc: '',
      args: [],
    );
  }

  /// `Apartment Details`
  String get ApartmentDetails {
    return Intl.message(
      'Apartment Details',
      name: 'ApartmentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get bottomBarFavourite {
    return Intl.message(
      'Favourite',
      name: 'bottomBarFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomBarHome {
    return Intl.message(
      'Home',
      name: 'bottomBarHome',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bottomBarSettings {
    return Intl.message(
      'Settings',
      name: 'bottomBarSettings',
      desc: '',
      args: [],
    );
  }

  /// `Rent a single`
  String get Rentasingle {
    return Intl.message(
      'Rent a single',
      name: 'Rentasingle',
      desc: '',
      args: [],
    );
  }

  /// `Rent a double`
  String get RentADouble {
    return Intl.message(
      'Rent a double',
      name: 'RentADouble',
      desc: '',
      args: [],
    );
  }

  /// `Rent a triple`
  String get RentATriple {
    return Intl.message(
      'Rent a triple',
      name: 'RentATriple',
      desc: '',
      args: [],
    );
  }

  /// ` EGP`
  String get EGP {
    return Intl.message(
      ' EGP',
      name: 'EGP',
      desc: '',
      args: [],
    );
  }

  /// `Single Bed`
  String get SingleBed {
    return Intl.message(
      'Single Bed',
      name: 'SingleBed',
      desc: '',
      args: [],
    );
  }

  /// `Double Bed`
  String get TripleBed {
    return Intl.message(
      'Double Bed',
      name: 'TripleBed',
      desc: '',
      args: [],
    );
  }

  /// `Triple Bed`
  String get DoubleBed {
    return Intl.message(
      'Triple Bed',
      name: 'DoubleBed',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get Hello {
    return Intl.message(
      'Hello',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message(
      'Back',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `Males only`
  String get Malesonly {
    return Intl.message(
      'Males only',
      name: 'Malesonly',
      desc: '',
      args: [],
    );
  }

  /// `FeMales only`
  String get FemalesOnly {
    return Intl.message(
      'FeMales only',
      name: 'FemalesOnly',
      desc: '',
      args: [],
    );
  }

  /// `Your Second Home, Your New Life`
  String get Slogan {
    return Intl.message(
      'Your Second Home, Your New Life',
      name: 'Slogan',
      desc: '',
      args: [],
    );
  }

  /// `RoomType`
  String get RoomType {
    return Intl.message(
      'RoomType',
      name: 'RoomType',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Complain`
  String get Complain {
    return Intl.message(
      'Complain',
      name: 'Complain',
      desc: '',
      args: [],
    );
  }

  /// `Referral`
  String get Referral {
    return Intl.message(
      'Referral',
      name: 'Referral',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LogOut {
    return Intl.message(
      'Log Out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get HelpandSupport {
    return Intl.message(
      'Help and Support',
      name: 'HelpandSupport',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get ChangeTheme {
    return Intl.message(
      'Change Theme',
      name: 'ChangeTheme',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get DeleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'DeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? Please read how account deletion will affect.Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.`
  String get AreYouSure {
    return Intl.message(
      'Are you sure you want to delete your account? Please read how account deletion will affect.Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.',
      name: 'AreYouSure',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
