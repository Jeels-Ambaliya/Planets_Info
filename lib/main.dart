import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_planets/views/screens/info.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gallaxy_Planets(),
    ),
  );
}

class Gallaxy_Planets extends StatefulWidget {
  const Gallaxy_Planets({Key? key}) : super(key: key);

  @override
  State<Gallaxy_Planets> createState() => _Gallaxy_PlanetsState();
}

class _Gallaxy_PlanetsState extends State<Gallaxy_Planets>
    with SingleTickerProviderStateMixin {
  List planets = [
    {
      'name': "SUN",
      'image': "assets/images/sun.png",
      'dec':
          "The Sun is a 4.5 billion-year-old yellow dwarf star – a hot glowing ball of hydrogen and helium – at the center of our solar system. It’s about 93 million miles (150 million kilometers) from Earth and it’s our solar system’s only star. Without the Sun’s energy, life as we know it could not exist on our home planet.\n\n From our vantage point on Earth, the Sun may appear like an unchanging source of light and heat in the sky. But the Sun is a dynamic star, constantly changing and sending energy out into space. The science of studying the Sun and its influence throughout the solar system is called heliophysics.\n\n The Sun is the largest object in our solar system. Its diameter is about 865,000 miles (1.4 million kilometers). Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it.",
    },
    {
      'name': "EARTH",
      'image': "assets/images/earth.png",
      'dec':
          "Earth is our home planet. Scientists believe Earth and its moon formed around the same time as the rest of the solar system. They think that was about 4.5 billion years ago. Earth is the fifth-largest planet in the solar system. Its diameter is about 8,000 miles. And Earth is the third-closest planet to the sun. Its average distance from the sun is about 93 million miles. Only Mercury and Venus are closer.\n\n Earth has been called the Goldilocks planet. In the story of Goldilocks and the Three Bears a little girl named Goldilocks liked everything just right. Her porridge couldn't be too hot or too cold. And her bed couldn't be too hard or too soft. On Earth, everything is just right for life to exist. It's warm, but not too warm. And it has water, but not too much water.\n\n Earth is the only planet known to have large amounts of liquid water. Liquid water is essential for life. Earth is the only planet where life is known to exist.",
    },
    {
      'name': "MERCURY",
      'image': "assets/images/mercury.png",
      'dec':
          "Mercury is the smallest planet in our solar system. It’s a little bigger than Earth’s Moon. It is the closest planet to the Sun, but it’s actually not the hottest. Venus is hotter.\n\nAlong with Venus, Earth, and Mars, Mercury is one of the rocky planets. It has a solid surface that is covered with craters like our Moon. It has a thin atmosphere, and it doesn’t have any moons. Mercury likes to keep things simple.\n\n Mercury spins slowly compared to Earth, so one day lasts a long time. Mercury takes 59 Earth days to make one full rotation. But a year on Mercury goes fast. Because it’s the closest planet to the sun, it goes around the Sun in just 88 Earth days.",
    },
    {
      'name': "VENUS",
      'image': "assets/images/venus.png",
      'dec':
          "Venus is the second planet from the Sun, and is Earth's closest neighbor in the solar system. Venus is the brightest object in the sky after the Sun and the Moon, and sometimes looks like a bright star in the morning or evening sky. The planet is a little smaller than Earth, and is similar to Earth inside.\n\nWe can't see the surface of Venus from Earth, because it is covered with thick clouds. However, space missions to Venus have shown us that its surface is covered with craters, volcanoes, mountains, and big lava plains. The surface of Venus is not where you'd like to be, with temperatures that can melt lead, an atmosphere so thick it would crush you, and clouds of sulfuric acid that smell like rotten eggs to top it off!",
    },
    {
      'name': "MARS",
      'image': "assets/images/mars.png",
      'dec':
          "Mars is the fourth planet from the Sun and the next planet beyond Earth. It is, on average, more than 142 million miles from the Sun. Mars turns on its axis more slowly than Earth does. So, a day on Mars is 24.6 hours. Since this planet is farther from the Sun than Earth, one revolution of Mars around the Sun is a longer trip. So, a year on Mars is 687 Earth days. Mars is about half the size of Earth. Mars is known as the Red Planet because the iron oxide chemicals in its soil looks like rust.\n\nMars is named for the ancient Roman god of war. The Greeks called the planet Ares (pronounced Air-EEZ). The Romans and Greeks associated the planet with war because its color resembles the color of blood.",
    },
    {
      'name': "JUPITER",
      'image': "assets/images/jupiter.png",
      'dec':
          "Jupiter is the largest planet in the solar system. It is approximately 143,000 kilometers (about 89,000 miles) wide at its equator. Jupiter is so large that all of the other planets in the solar system could fit inside it. More than 1,300 Earths would fit inside Jupiter.\n\n Jupiter is like a star in composition. If Jupiter had been about 80 times more massive, it would have become a star rather than a planet.",
    },
  ];

  double degreeEnd = 2 * pi;
  late AnimationController animationController;
  late Animation<double> continueAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 20,
      ),
    );

    continueAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          0,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    continueAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.repeat();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "GALAXY PLANETS",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
          children: List.generate(
            planets.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Info(
                        name: planets[index]['name'],
                        image: planets[index]['image'],
                        dec: planets[index]['dec'],
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: RotationTransition(
                            turns: animationController,
                            child: Hero(
                              tag: "${planets[index]['name']}",
                              transitionOnUserGestures: true,
                              child: Image.asset("${planets[index]['image']}"),
                            ),
                          ),
                          // child: TweenAnimationBuilder(
                          //   tween: Tween<double>(begin: 0, end: degreeEnd),
                          //   duration: const Duration(seconds: 20),
                          //   curve: Curves.easeInOut,
                          //   onEnd: () {
                          //     setState(() {
                          //       degreeEnd = degreeEnd == 2 * pi ? 0 : 2 * pi;
                          //     });
                          //   },
                          //   child: Hero(
                          //     tag: "${planets[index]['name']}",
                          //     transitionOnUserGestures: true,
                          //     child: Image.asset("${planets[index]['image']}"),
                          //   ),
                          //   builder: (context, double degree, widget) {
                          //     return Transform.rotate(
                          //       angle: degree,
                          //       child: widget,
                          //     );
                          //   },
                          // ),
                        ),
                        Expanded(
                          child: Text(
                            "${planets[index]['name']}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
