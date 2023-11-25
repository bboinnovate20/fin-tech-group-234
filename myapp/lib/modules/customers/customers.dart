import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/shared/empty.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: const Color.fromARGB(255, 254, 193, 193),
          actions: [
            GestureDetector(
              onTap: () => Modular.to.pushNamed('/add-customer'),
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
          title: Text("Customers List",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge),
        ),
        body: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Empty(
                message:
                    "You do not have any customer at the moment. please create one")));
  }
}

class SearchCustomer extends StatelessWidget {
  const SearchCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SearchAnchor(
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return [];
            },
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 15, vertical: 9)),
                side: const MaterialStatePropertyAll(BorderSide(
                  width: 2.0,
                  color: Color.fromRGBO(232, 232, 232, 1),
                )),
                hintText: "Search Customer",
                hintStyle: MaterialStatePropertyAll(TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.secondary)),
                elevation: const MaterialStatePropertyAll(0),
                surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
                leading: Image.asset("assets/search-normal.png",
                    width: 22, height: 22),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (BuildContext context, index) =>
                  const CustomerCard(),
              itemCount: 5),
        )
      ],
    );
  }
}

class CustomerCard extends StatefulWidget {
  const CustomerCard({super.key});

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 12,
                spreadRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 9.0, top: 9.0),
              child: Text(
                "Tolu Adeboye ",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                "Tolu@gmail.com  | +2348012345678",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Text(
              "23 Kings street, Ikeja, Lagos ",
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}

class ListCustomer extends StatefulWidget {
  const ListCustomer({super.key});

  @override
  State<ListCustomer> createState() => _ListCustomerState();
}

class _ListCustomerState extends State<ListCustomer> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
