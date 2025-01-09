import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curver_edges_widget.dart';
import 'circular_container.dart';

class MPrimaryHeaderContainer extends StatelessWidget {
  const MPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MCurvedEdgeWidget(
      child: Container(
        color: MColors.primary,
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 350,
          child: Stack(
            children: [
              /// -- Background Custom shapes
              Positioned(
                top: -150,
                right: -250,
                child: MCircularContainer(
                  backgroundColor: MColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: MCircularContainer(
                  backgroundColor: MColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
