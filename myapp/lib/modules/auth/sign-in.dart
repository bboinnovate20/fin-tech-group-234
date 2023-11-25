// ignore_for_file: avoid_unnecessary_containers

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/shared/button.dart';
import 'package:intl/intl.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
    //check for sign up state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text("Welcome back!",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Enter your details below to login",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          // inputs
          InputCustom(
            keyboard: TextInputType.emailAddress,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Email address",
          ),

          // inputs
          InputCustom(
            keyboard: TextInputType.text,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Password",
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 5),
            child: GestureDetector(
                onTap: () => {},
                child:
                    const Text("Forget Password", textAlign: TextAlign.right)),
          ),
          Button(
            loadingMessage: "Signing in",
            isLoading: false,
            label: "Login",
            action: () => {Modular.to.navigate("/home")},
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: GestureDetector(
                onTap: () => {Modular.to.navigate("/sign-up")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Text("Don’t have an account?",
                          textAlign: TextAlign.center),
                    ),
                    Text("Sign up",
                        style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center)
                  ],
                )),
          )
        ],
      )),
    )));
  }
}

class InputCustom extends StatelessWidget {
  Function validate;
  String placeholder;
  bool obscure;
  TextInputType keyboard;
  int maxLines;

  InputCustom(
      {super.key,
      required this.validate,
      required this.placeholder,
      required this.obscure,
      required this.keyboard,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              placeholder,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
          ),
          TextFormField(
            obscureText: obscure,
            autocorrect: true,
            validator: (value) {
              validate(value);
              return null;
            },
            keyboardType: keyboard,
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(17),
              alignLabelWithHint: true,
              labelText: null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1.5, color: Color.fromRGBO(232, 232, 232, 1))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

class InputCustomCurrency extends StatelessWidget {
  Function validate;
  String placeholder;
  bool obscure;

  InputCustomCurrency({
    super.key,
    required this.validate,
    required this.placeholder,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              placeholder,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              CurrencyTextInputFormatter(
                locale: 'ko',
                decimalDigits: 0,
                symbol: 'N',
              ),
            ],
            obscureText: obscure,
            autocorrect: true,
            validator: (value) {
              validate(value);
              return null;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(17),
              alignLabelWithHint: true,
              labelText: null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1.5, color: Color.fromRGBO(232, 232, 232, 1))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}

class InputCustomDate extends StatefulWidget {
  Function validate;
  String placeholder;
  bool obscure;

  InputCustomDate({
    super.key,
    required this.validate,
    required this.placeholder,
    required this.obscure,
  });

  @override
  State<InputCustomDate> createState() => _InputCustomDateState();
}

class _InputCustomDateState extends State<InputCustomDate> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = DateFormat('EEE, d MMM, y')
        .format(DateTime.now())
        .toString(); //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.placeholder,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
          ),
          TextFormField(
            controller: dateinput, //editing controller of this TextField
            obscureText: widget.obscure,
            autocorrect: true,
            readOnly: true,
            keyboardType: TextInputType.datetime,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('EEE, d MMM, y').format(pickedDate);

                setState(() {
                  dateinput.text =
                      formattedDate; //set output date to TextField value.
                });
              }
            },

            validator: (value) {
              widget.validate(value);
              return null;
            },

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(17),
              alignLabelWithHint: true,
              labelText: null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1.5, color: Color.fromRGBO(232, 232, 232, 1))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              labelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
