import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/modules/auth/sign-in.dart';
import 'package:myapp/shared/button.dart';

class FormCustomer extends StatefulWidget {
  const FormCustomer({super.key});

  @override
  State<FormCustomer> createState() => _FormCustomerState();
}

class _FormCustomerState extends State<FormCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: Modular.to.pop,
            child: const Icon(FontAwesomeIcons.chevronLeft, size: 18)),
        surfaceTintColor: Colors.white,
        title: Text("Add Customer",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputCustom(
                  keyboard: TextInputType.text,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "First Name",
                  obscure: false),
              InputCustom(
                  keyboard: TextInputType.text,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Last Name",
                  obscure: false),
              InputCustom(
                  keyboard: TextInputType.emailAddress,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Email",
                  obscure: false),
              InputCustom(
                  keyboard: TextInputType.phone,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Phone Number",
                  obscure: false),
              InputCustom(
                  keyboard: TextInputType.text,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Address",
                  obscure: false),
              Button(
                loadingMessage: "Signing up",
                isLoading: false,
                label: "Sign up",
                action: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
