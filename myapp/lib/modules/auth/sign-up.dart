// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/modules/auth/sign-in.dart';
import 'package:myapp/shared/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            child: Text("Let’s get started!",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Fill in your details below to get started",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),

          // inputs
          InputCustom(
            keyboard: TextInputType.text,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "First Name",
          ),

          InputCustom(
            keyboard: TextInputType.text,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Last Name",
          ),

          InputCustom(
            keyboard: TextInputType.text,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Business Name",
          ),

          InputCustom(
            keyboard: TextInputType.emailAddress,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Email Address",
          ),

          InputCustom(
            keyboard: TextInputType.phone,
            obscure: false,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Phone Number",
          ),

          InputCustom(
            keyboard: TextInputType.text,
            obscure: true,
            validate: (value) {
              if (value!.isEmpty) return "Empty";
            },
            placeholder: "Password",
          ),

          Button(
            loadingMessage: "Signing Up",
            isLoading: false,
            label: "Sign up",
            action: () => {Modular.to.navigate("/sign-in")},
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: InkWell(
                onTap: () => {Modular.to.navigate("/sign-in")},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Text("Already have an account?",
                          textAlign: TextAlign.center),
                    ),
                    Text("Login",
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

// class InputCustom extends StatelessWidget {
//   Function validate;
//   String placeholder;
//   bool obscure;

//   InputCustom(
//       {super.key,
//       required this.validate,
//       required this.placeholder,
//       required this.obscure});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 15),
//       child: TextFormField(
//         obscureText: obscure,
//         autocorrect: true,
//         validator: (value) {
//           validate(value);
//           return null;
//         },
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(
//           labelText: placeholder,
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(width: 1.5, color: Colors.black26)),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 width: 1.8, color: Theme.of(context).colorScheme.primary),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelStyle: Theme.of(context)
//               .textTheme
//               .labelLarge
//               ?.copyWith(color: Theme.of(context).colorScheme.secondary),
//         ),
//       ),
//     );
//   }
// }
