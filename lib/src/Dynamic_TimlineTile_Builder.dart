import 'package:dynamic_timeline_tile_flutter/dynamic_timeline_tile_flutter.dart';
import 'package:flutter/material.dart';

// Defining a Builder function for dynamic tile builder

typedef DynamicTimeLineTileBuilder = DynamicTimelineTile Function(
    BuildContext context, int index);

class DynamicTimelineTileBuilder extends StatelessWidget {
  // Declaring itemCount for the number of data to be shown

  final int itemCount;

  final DynamicTimeLineTileBuilder itemBuilder;

  DynamicTimelineTileBuilder({
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      // Generating the list user provide

      children: List.generate(

        itemCount,
        (index) => itemBuilder(context, index),
      ),
    );
  }
}

// for multi builder

// Defining a Builder function for multi dynamic tile builder

typedef MultiDunamicTileBuilder = MultiDynamicTimelineTile Function(
    BuildContext context, int index);

class MultiDynamicTimelineTileBuilder extends StatelessWidget {
  // Declaring itemCount for the number of data to be shown

  final int itemCount;

  final MultiDunamicTileBuilder itemBuilder;

  MultiDynamicTimelineTileBuilder({
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => itemBuilder(context, index),
      ),
    );
  }
}
