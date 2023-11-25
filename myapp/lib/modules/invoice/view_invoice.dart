import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/shared/button.dart';
import 'package:myapp/shared/pdf_mod.dart';
import 'package:share_plus/share_plus.dart';

class ViewInvoice extends StatefulWidget {
  const ViewInvoice({super.key});

  @override
  State<ViewInvoice> createState() => _ViewInvoiceState();
}

class _ViewInvoiceState extends State<ViewInvoice> {
  bool loading = false;
  bool isShared = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        leading: GestureDetector(
            onTap: Modular.to.pop,
            child: const Icon(FontAwesomeIcons.chevronLeft, size: 18)),
        surfaceTintColor: Colors.white,
        title: Text("Invoice | Adewole",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 12, top: 20),
                        child: Text(
                          "Invoice Details",
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                    const InvoiceData(),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Note",
                              style: Theme.of(context).textTheme.bodySmall),
                          Container(
                            margin: const EdgeInsets.only(top: 6, bottom: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.2,
                                  color:
                                      const Color.fromRGBO(220, 227, 231, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                  "Kindly ensure the payment is completed within a 30-minute timeframe."),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Button(
                      isLoading: loading,
                      loadingMessage: "Sharing",
                      label: "Share Invoice",
                      action: () async {
                        showModal(context);
                        // setState(() {
                        //   loading = true;
                        // });

                        // print("Loading");

                        // await Future.delayed(const Duration(seconds: 1));
                        // // ignore: use_build_context_synchronously
                        // showModal(context);
                      }),
                ),
                // Button(
                //   label: "Save Invoice",
                //   action: () {
                //     return showModal(context);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InvoiceData extends StatelessWidget {
  const InvoiceData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1, color: const Color.fromRGBO(220, 227, 231, 1))),
        child: ClipRect(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 248, 255, 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Text(
                    "Invoice #1",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Issue date",
                              style: Theme.of(context).textTheme.headlineSmall),
                          Text("10-10-2023",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Due date",
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text("10-10-2023",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              TableWidget(
                  serialNumber: "S/N",
                  isHeader: true,
                  item: "Item",
                  quantity: "Qty",
                  amount: "Amount"),
              TableWidget(
                  serialNumber: "1",
                  isHeader: false,
                  item: "Clothing",
                  quantity: "12",
                  amount: "10,000"),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 248, 255, 1)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Text(
                        "N 10,000",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 119, 255, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class TableWidget extends StatelessWidget {
  String item;
  String amount;
  String quantity;
  bool isHeader;
  String serialNumber;

  TableWidget(
      {super.key,
      required this.isHeader,
      required this.item,
      required this.amount,
      required this.quantity,
      required this.serialNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isHeader
          ? const BoxDecoration(color: Color.fromRGBO(240, 248, 255, 1))
          : const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: isHeader
            ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12)
            : const EdgeInsets.only(
                right: 20.0, left: 20.0, top: 25, bottom: 55),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Text(
                serialNumber,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                item,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                quantity,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                amount,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
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
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Tolu Adeboye ",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
      ),
    );
  }
}

Future<void> showModal(BuildContext context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          // color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Image.asset("assets/success.png",
                      width: 110, height: 110),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 8),
                  child: Text(
                    'Successful',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                ),
                Text(
                  "Your Invoice has been sent to Tolu",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Button(
                      action: () async {
                        Uint8List byte = await createPDF();

                        final result = await Share.shareXFiles([
                          XFile.fromData(byte,
                              name: "invoice", mimeType: "application/pdf")
                        ], text: 'Another Milestone!');

                        if (result.status == ShareResultStatus.success) {
                          print('Thank you for sharing the picture!');
                        }
                      },
                      label: "Share to your Customer",
                      loadingMessage: "",
                      isLoading: false),
                )
              ],
            ),
          ),
        );
      });
}
