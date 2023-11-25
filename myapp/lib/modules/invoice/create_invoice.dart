import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/modules/auth/sign-in.dart';
import 'package:myapp/shared/button.dart';

class CreateInvoice extends StatelessWidget {
  const CreateInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        leading: GestureDetector(
            onTap: Modular.to.pop,
            child: const Icon(FontAwesomeIcons.chevronLeft, size: 18)),
        surfaceTintColor: Colors.white,
        title: Text("Create Invoice",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: const CreateInvoiceS2(),
    );
  }
}

class CreateInvoiceS2 extends StatefulWidget {
  const CreateInvoiceS2({super.key});

  @override
  State<CreateInvoiceS2> createState() => _CreateInvoiceS2();
}

class _CreateInvoiceS2 extends State<CreateInvoiceS2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
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
                    surfaceTintColor:
                        const MaterialStatePropertyAll(Colors.white),
                    leading: Image.asset("assets/search-normal.png",
                        width: 22, height: 22),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, index) => InkWell(
                      onTap: () {
                        Modular.to.pushNamed("/invoice-summary");
                      },
                      child: CustomerCard(value: index)),
                  separatorBuilder: (BuildContext context, index) =>
                      const Divider(),
                  itemCount: 5),
            )
          ],
        ));
  }
}

class CreateInvoiceS1 extends StatelessWidget {
  const CreateInvoiceS1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter the product details below ",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge),
              InputCustom(
                  keyboard: TextInputType.text,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Product Name",
                  obscure: false),
              InputCustomCurrency(
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Amount",
                  obscure: false),
              InputCustom(
                  keyboard: TextInputType.number,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Quantity",
                  obscure: false),
              InputCustomDate(
                  obscure: false, validate: () {}, placeholder: "Date"),
              InputCustom(
                  keyboard: TextInputType.text,
                  maxLines: 4,
                  validate: () {
                    print('ddd');
                  },
                  placeholder: "Description",
                  obscure: false),
              Button(
                loadingMessage: "Signing up",
                isLoading: false,
                label: "Continue",
                action: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerCard extends StatefulWidget {
  int value;
  CustomerCard({super.key, required this.value});

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Tolu Adeboye ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              "Tolu@gmail.com  | +2348012345678",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "23 Kings street, Ikeja, Lagos ",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
