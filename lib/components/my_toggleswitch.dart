import 'package:flutter/material.dart';

class MyToggleSwitch extends StatefulWidget {
  const MyToggleSwitch({super.key});

  @override
  MyToggleSwitchState createState() => MyToggleSwitchState();
}

class MyToggleSwitchState extends State<MyToggleSwitch> {
  bool isAM = true;

  void toggleButton() {
    setState(() {
      isAM = !isAM;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 40.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: isAM
                ? Colors.grey
                : Colors.grey[600], // Cambia el color de fondo
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.0,
            ),
          ),
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                top: 1.0,
                left: isAM ? 0.0 : 40.0,
                right: isAM ? 40.0 : 0.0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: toggleButton,
                    borderRadius: BorderRadius.circular(20.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.white, // Fondo blanco para el círculo
                        radius: 18.0,
                        child: Center(
                          child: Text(
                            isAM ? "AM" : "PM",
                            style: TextStyle(
                              color: isAM
                                  ? Colors.black
                                  : Colors.black, // Cambia el color del texto
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
