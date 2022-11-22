import 'package:flutter/material.dart';

import '../main.dart';

class CardModelNav extends StatelessWidget {
  final String tituloCardModel;
  final route;
  final IconData icon;

  const CardModelNav(this.tituloCardModel, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                tituloCardModel,
                textScaleFactor: 1.50,
              ),
              leading: Icon(icon),
            ),
          ),
        ],
      ),
      onTap: () {
        loading = 1;
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class CardModelPopPush extends StatelessWidget {
  final String tituloCardModel;
  final route;

  const CardModelPopPush(this.tituloCardModel, this.route);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                tituloCardModel,
                textScaleFactor: 1.50,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        loading = 1;
        Navigator.popAndPushNamed(context, route);
      },
    );
  }
}
