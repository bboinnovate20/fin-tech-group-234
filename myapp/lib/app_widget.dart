import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/modules/auth/sign-up.dart';
import 'package:myapp/modules/auth/sign-in.dart';
import 'package:myapp/modules/customers/add_customer.dart';
import 'package:myapp/modules/customers/customers.dart';
import 'package:myapp/modules/history/history.dart';
import 'package:myapp/modules/home/home.dart';
import 'package:myapp/modules/invoice/create_invoice.dart';
import 'package:myapp/modules/invoice/invoice.dart';
import 'package:myapp/modules/invoice/invoice_summary.dart';
import 'package:myapp/modules/invoice/view_invoice.dart';
import 'package:myapp/modules/main.dart';
import 'package:myapp/modules/welcome/presenter.dart';
import 'package:myapp/shared/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'FinTech App',
      theme: _buildTheme(),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const Welcome(),
        transition: TransitionType.defaultTransition);
    r.child('/add-customer',
        child: (context) => const FormCustomer(),
        transition: TransitionType.defaultTransition);
    r.child('/create-invoice',
        child: (context) => const CreateInvoice(),
        transition: TransitionType.defaultTransition);
    r.child('/invoice-summary',
        child: (context) => const InvoiceSummary(),
        transition: TransitionType.leftToRightWithFade);
    r.child('/view-invoice',
        child: (context) => const ViewInvoice(),
        transition: TransitionType.leftToRightWithFade);

    r.child('/home',
        child: (context) => const AppNavigation(),
        transition: TransitionType.defaultTransition);
    // r.child('/', child: (context) => const FormCustomer());
    // r.child('/', child: (context) => const Welcome());
    r.child('/sign-in',
        child: (context) => const SignIn(),
        transition: TransitionType.defaultTransition);
    r.child('/sign-up',
        child: (context) => const SignUp(),
        transition: TransitionType.defaultTransition);
  }
}

ThemeData _buildTheme() {
  var baseTheme = theme;
  return baseTheme.copyWith(
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme));
}
