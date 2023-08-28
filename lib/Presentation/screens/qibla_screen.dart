import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/colors.dart';
import '../../Business_Logic/Cubit/app_cubit.dart';
import '../../Business_Logic/Cubit/app_states.dart';
import '../Widgets/custom_app_bar.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  QiblaScreenState createState() => QiblaScreenState();
}

class QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'القبلة', isHome: true),
      backgroundColor: AppCubit.get(context).directionModel == null
          ? Colors.white
          : Colors.white,
      body: AppCubit.get(context).directionModel == null
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (AppCubit.get(context).directionModel == null)
                    Image.asset(
                      'assets/404.gif',
                      width: 410,
                      height: 370,
                    ),
                  const Text(
                    "تأكد من الاتصال بالإنترنت \n وتفعيل الموقع",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : Builder(builder: (context) {
              return Column(
                children: <Widget>[
                  Expanded(child: _buildCompass()),
                ],
              );
            }),
    );
  }

  Widget _buildCompass() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // Adjust this value to control rotation speed

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        int? qibla;
        if (AppCubit.get(context).directionModel != null) {
          qibla = AppCubit.get(context).directionModel!.data.direction.round();
        }

        return StreamBuilder<CompassEvent>(
          stream: FlutterCompass.events,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error reading heading: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            double? direction =
                snapshot.data?.heading; // Use null safe operator
            double? rotatedAngle;

            if (direction != null) {
              direction = direction.round().toDouble();
              if (direction < 0) {
                direction = direction + 360;
              }
              if (qibla == direction) {
                Vibrate.feedback(FeedbackType.heavy);
              }
              double rotationSpeedFactor =
                  0.2; // Adjust this value to control rotation speed
              rotatedAngle =
                  (direction * (math.pi / 180) * -1) * rotationSpeedFactor;
            }

            // if direction is null, then device does not support this sensor
            if (direction == null) {
              return const Center(
                child: Text("Device does not have sensors !"),
              );
            }

            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFEBEBEB),
                  ),
                  child: Transform.rotate(
                    angle: rotatedAngle ??
                        0, // Use the rotatedAngle value if not null
                    child: Image.asset('assets/qibla_screen.png'),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${direction.round()}°',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 65,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: (width / 2) - ((width / 4) / 2),
                  top: (height - width) / 10,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (direction < qibla!)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'تحرك إلى اليمين',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRightLong,
                                  color: AppColors.primaryColor,
                                  size: 40,
                                ),
                              ],
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (direction > qibla)
                            Row(
                              children: [
                                Text(
                                  'تحرك إلى اليسار',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowLeftLong,
                                  color: AppColors.primaryColor,
                                  size: 40,
                                ),
                              ],
                            ),
                        ],
                      ),
                      SizedBox(
                        height: qibla == direction ? 100 : 0,
                        width: qibla == direction ? 100 : 0,
                        child: Image.asset('assets/qibla_icon.png'),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: (60),
                  top: (700),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' اتجاة القبلة هو  $qibla° من الشمال ',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
