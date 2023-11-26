import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/shared/empty.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        surfaceTintColor: const Color.fromARGB(255, 254, 193, 193),
        actions: [
          GestureDetector(
            onTap: () => Modular.to.pushNamed('/create-invoice'),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "+  Add",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
        title: Text("Invoice",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: Empty(
        message: "You do not have any Invoice at the moment. please create one",
      ),
    );
  }
}

// Empty(
//         message: "You do not have any Invoice at the moment. please create one",
//       ),
