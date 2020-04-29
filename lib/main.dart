import 'dart:math' as math show pi;
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/counters.dart';
import 'package:pomodoro_timer/header_button.dart';
import 'package:pomodoro_timer/playButton.dart';
import 'package:pomodoro_timer/playButtonPressed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color(0xffECF0F3),
        primaryColor: Color(0xff3372F7),
        textTheme: TextTheme(
          title: TextStyle(
            color: Color(0xff2C2C2C),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xff7D839A),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;
  bool isPlaying = false;
  bool muted = false;
  bool notificationsOff = false;

  int workTime = 1200;
  int breakTime = 300;
  int longBreakTime = 1500;
  int completedWork = 1;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: longBreakTime),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                // Header
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  HeaderButton(
                    toggleHandler: muted,
                    onPress: () {
                      setState(() {
                        muted = !muted;
                      });
                    },
                    icon: muted
                        ? Icon(
                            Icons.volume_off,
                            size: 20,
                          )
                        : Icon(
                            Icons.volume_up,
                            size: 20,
                          ),
                  ),
                  Text(
                    'Pomodoro',
                    style: TextStyle(
                      color: themeData.textTheme.title.color,
                      fontSize: 30,
                    ),
                  ),
                  HeaderButton(
                    toggleHandler: notificationsOff,
                    onPress: () {
                      setState(() {
                        notificationsOff = !notificationsOff;
                      });
                    },
                    icon: notificationsOff
                        ? Icon(
                            Icons.notifications_off,
                            size: 20,
                          )
                        : Icon(
                            Icons.notifications_active,
                            size: 20,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 60),
              // Countdown Timer
              Container(
                height: 275,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffDAE1EB),
                      offset: Offset(10.0, 10.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Color(0xffffffff),
                      offset: Offset(-10.0, -10.0),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Align(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child) {
                              return CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: themeData.primaryColor,
                                ),
                              );
                            },
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Positioned(
                              top: 100.0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  children: <Widget>[
                                    AnimatedBuilder(
                                      animation: controller,
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return Text(
                                          timerString,
                                          style: TextStyle(
                                              color: themeData
                                                  .textTheme.title.color,
                                              fontSize: 60),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Work',
                style: TextStyle(fontSize: 24),
              ),
              Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    (completedWork >= 1
                        ? Counters(completed: true)
                        : Counters(
                            completed: false,
                          )),
                    (completedWork >= 2
                        ? Counters(completed: true)
                        : Counters(
                            completed: false,
                          )),
                    (completedWork >= 3
                        ? Counters(completed: true)
                        : Counters(
                            completed: false,
                          )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Play Pause Button
              Container(
                margin: EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: isPlaying
                          ? PlayButtonPressed(
                              icon: Icon(
                                Icons.pause,
                              ),
                            )
                          : PlayButton(
                              icon: Icon(Icons.play_arrow),
                            ),
                      onTap: () {
                        if (controller.isAnimating) {
                          setState(() {
                            isPlaying = false;
                          });
                          controller.stop();
                        } else {
                          setState(() {
                            isPlaying = true;
                          });
                          controller.reverse(
                              from: controller.value == 0.0
                                  ? 1.0
                                  : controller.value);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
