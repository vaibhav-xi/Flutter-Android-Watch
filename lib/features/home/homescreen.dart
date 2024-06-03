// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomlights/features/datails/widgets/animation.dart';
import 'package:roomlights/features/home/controller/controller.dart';
import 'package:roomlights/features/home/widgets/add_device.dart';
import 'package:roomlights/features/home/widgets/custom_card.dart';
import 'package:roomlights/features/home/widgets/scale_fadeanimation.dart';
import 'package:roomlights/features/home/widgets/master_painter.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  var model_list = Controller().model_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1D30),
      body: CustomPaint(
        painter: MasterPainter(),
        child: BounceFromBottomAnimation(
          delay: 10,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              BounceFromBottomAnimation(delay: 6, child: addDevice()),
              const SizedBox(
                height: 60,
              ),
              SingleChildScrollView(
                child: SizedBox(
                height: 620,
                width: 420,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Controller().model_list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var data = Controller().model_list[index];
                    return ScaleFadeAnimation(
                      delay: 2.5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                            },
                            child: CustomCardView(model: data)),
                      ),
                    );
                  },
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
