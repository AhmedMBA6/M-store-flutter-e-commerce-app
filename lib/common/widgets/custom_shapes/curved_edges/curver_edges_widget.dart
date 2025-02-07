import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class MCurvedEdgeWidget extends StatelessWidget {
  const MCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MCutomCurvedEdges(),
      child: child,
    );
  }
}
