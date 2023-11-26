import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/shared/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const TopHomeHeader(),
            const Wallet(),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Features()),
            SizedBox(
                height: (MediaQuery.of(context).size.height / 2) + 70,
                child: Transactions(fullTransaction: false)),
          ]),
        ),
      ),
    );
  }
}

class TopHomeHeader extends StatelessWidget {
  const TopHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 14.0),
                child: Image.asset("assets/Vector.png", width: 22, height: 22),
              ),
              Text("Hello Tolu,",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
          NotificationButton(count: 2)
        ],
      ),
    );
  }
}

class NotificationButton extends StatelessWidget {
  int count;

  NotificationButton({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/notification.png", width: 26, height: 26),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.red),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5.0),
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  bool isSeen = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Wallet Balance",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              height: 40,
              child: Text(
                isSeen ? "N0.00" : "****",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
        // GestureDetector(
        //   onTap: () {
        //     setState(() => isSeen = !isSeen);
        //   },
        //   child: Icon(isSeen ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
        //       size: 18),
        //   // child: const Icon(FontAwesomeIcons.eye),
        // )
      ],
    );
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabelIconButton(
            icon: "assets/receipt.png",
            action: () {
              print('dd');
            },
            label: "Create Invoice"),
        LabelIconButton(
            icon: "assets/history.png",
            action: () {
              print('dd');
            },
            label: "History"),
        LabelIconButton(
            action: () {
              print('dd');
            },
            icon: "assets/send-2.png",
            label: "Withdraw")
      ],
    );
  }
}

class Transactions extends StatelessWidget {
  bool fullTransaction;
  Transactions({super.key, required this.fullTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: fullTransaction
            ? const BoxDecoration()
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 15)
                  ]),
        margin: EdgeInsets.only(top: fullTransaction ? 10 : 25),
        child: Padding(
          padding: fullTransaction
              ? const EdgeInsets.symmetric(horizontal: 25)
              : const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Transactions",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  !fullTransaction
                      ? GestureDetector(
                          onTap: () => {},
                          child: Text(
                            "View More",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ))
                      : Container()
                ],
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, index) =>
                        TransactionCard(
                            status: index == 1
                                ? 1
                                : index == 2
                                    ? 2
                                    : 3),
                    separatorBuilder: (BuildContext context, index) =>
                        const Divider(color: Color.fromRGBO(0, 0, 0, 0.05)),
                    itemCount: 5),
              )
            ],
          ),
        ));
  }
}

class TransactionCard extends StatelessWidget {
  int status;
  TransactionCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed("/view-invoice");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 11),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromRGBO(241, 245, 254, 1)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/received.png",
                          width: 23, height: 23))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "Tolu Adeboye ",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Text(
                      "Received | 10:00 am",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "5,000",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 2),
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                      color: status == 1
                          ? const Color.fromRGBO(82, 196, 26, 0.09)
                          : status == 2
                              ? const Color.fromRGBO(245, 34, 45, 0.09)
                              : const Color.fromRGBO(250, 173, 20, 0.09),
                      borderRadius: BorderRadius.circular(5)),
                  child: status == 1
                      ? const Text("Successful",
                          style: TextStyle(
                              color: Color.fromRGBO(82, 196, 26, 1),
                              fontSize: 11))
                      : status == 2
                          ? const Text("Failed",
                              style: TextStyle(
                                  color: Color.fromRGBO(245, 34, 45, 1),
                                  fontSize: 11))
                          : const Text("Pending",
                              style: TextStyle(
                                  color: Color.fromRGBO(250, 173, 20, 1),
                                  fontSize: 11)))
            ],
          )
        ]),
      ),
    );
  }
}
