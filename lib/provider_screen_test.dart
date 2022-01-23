import 'package:flutter/material.dart';

class AnimationTest extends StatefulWidget {
  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('test'),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            color: Colors.redAccent,
                          ),
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.bottomRight,
                            child: AnimatedCart(),
                          ))
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

class AnimatedCart extends StatefulWidget {
  @override
  State<AnimatedCart> createState() => _AnimatedCartState();
}

class _AnimatedCartState extends State<AnimatedCart> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        setState(() {
          x = !x;
        });
      },
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: Duration(seconds: 2),
        height: 50,
        width: x
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
