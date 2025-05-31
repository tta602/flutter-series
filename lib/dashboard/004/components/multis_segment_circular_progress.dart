import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math';

class MultiSegmentCircularProgress extends StatelessWidget {
  final double done;
  final double todo;
  final double pending;
  final double other;

  const MultiSegmentCircularProgress({
    super.key,
    required this.done,
    required this.pending,
    required this.todo,
    required this.other
  });

  @override
  Widget build(BuildContext context) {
    // Phần trăm từng loại

    const double radius = 70.0;
    const lineWidth = 15.0;

    // Định nghĩa từng đoạn với màu và phần trăm
    final segments = [
      {'percent': done, 'color': Colors.deepOrangeAccent},
      {'percent': todo, 'color': Colors.amber},
      {'percent': pending, 'color': Colors.deepPurple},
      {'percent': other, 'color': Colors.grey},
    ];

    double accumulatedAngle = 0;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Vòng nền
              CircularPercentIndicator(
                radius: radius,
                lineWidth: lineWidth,
                percent: 1.0,
                center: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "100",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "Total Project",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                progressColor: Colors.grey.shade200,
                backgroundColor: Colors.grey.shade200,
                circularStrokeCap: CircularStrokeCap.round,
              ),

              // Vẽ từng segment theo phần trăm + xoay theo góc tích lũy
              ...segments.map((segment) {
                final widget = Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: accumulatedAngle * 2 * pi,
                      child: CircularPercentIndicator(
                        radius: radius,
                        lineWidth: lineWidth,
                        percent: segment['percent'] as double,
                        progressColor: segment['color'] as Color,
                        backgroundColor: Colors.transparent,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                  ),
                );
                accumulatedAngle += segment['percent'] as double;
                return widget;
              }).toList(),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProgressLegend(color: Colors.deepOrangeAccent, label: '45%', title: 'Done'),
              _ProgressLegend(color: Colors.amber, label: '15%', title: 'To Do'),
              _ProgressLegend(color: Colors.deepPurple, label: '30%', title: 'Pending'),
              _ProgressLegend(color: Colors.grey, label: '10%', title: 'Other'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgressLegend extends StatelessWidget {
  final Color color;
  final String label;
  final String title;

  const _ProgressLegend({
    required this.color,
    required this.label,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 8),
              Text(label, style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
