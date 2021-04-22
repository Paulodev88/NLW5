import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: 75,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: .75,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text(
                "75%",
                style: AppTextStyles.heading,
              ),
            )
          ],
        ));
  }
}
