import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatefulWidget {
  String label;
  Function action;
  String loadingMessage;
  bool isLoading;
  Color color;

  Button(
      {super.key,
      required this.action,
      required this.label,
      required this.loadingMessage,
      required this.isLoading,
      this.color = const Color(0xFF0471CC)});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              if (!widget.isLoading) {
                // ignore: void_checks
                return widget.action();
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor:
                    widget.isLoading ? Colors.blue[50] : widget.color),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: widget.isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: false),
                          effects: const [
                            RotateEffect(
                                curve: Curves.linear,
                                duration: Duration(milliseconds: 700))
                          ],
                          child: const Icon(FontAwesomeIcons.spinner),
                        ),
                        Container(width: 10),
                        Text(widget.loadingMessage)
                      ],
                    )
                  : Text(widget.label,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}

class LabelIconButton extends StatelessWidget {
  String label;
  Function action;
  String icon;
  LabelIconButton(
      {super.key,
      required this.action,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {action()},
        child: Container(
          margin: const EdgeInsets.only(top: 8),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 13.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)),
                backgroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () => {},
            icon: Image.asset(icon, width: 22, height: 22),
            label: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ));
  }
}
