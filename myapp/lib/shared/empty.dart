import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Empty extends StatelessWidget {
  String message;
  Empty({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 100,
                height: 100,
                child: Image.asset("assets/empty-folder.png")),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
            )
          ],
        ),
      ),
    );
    // Center(
    //   child: Column(
    //     children: [
    //       Icon(FontAwesomeIcons.folderOpen),
    //       Text("You do not have any customer at the moment. please create one")
    //     ],
    //   ),
  }
}
