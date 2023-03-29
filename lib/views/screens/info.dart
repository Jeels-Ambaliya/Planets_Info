import 'dart:math';

import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final String name;
  final String image;
  final String dec;
  const Info(
      {Key? key, required this.name, required this.image, required this.dec})
      : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  double degreeEnd = 2 * pi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.name,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: degreeEnd),
                  duration: const Duration(seconds: 20),
                  curve: Curves.easeInOut,
                  onEnd: () {
                    setState(() {
                      degreeEnd = degreeEnd == 2 * pi ? 0 : 2 * pi;
                    });
                  },
                  child: Hero(
                    tag: widget.name,
                    transitionOnUserGestures: true,
                    child: Image.asset(widget.image),
                  ),
                  builder: (context, double degree, widget) {
                    return Transform.rotate(
                      angle: degree,
                      child: widget,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Text(
                  widget.dec,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
