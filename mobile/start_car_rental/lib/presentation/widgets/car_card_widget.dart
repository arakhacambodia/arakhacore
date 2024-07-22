import 'package:flutter/material.dart';
import 'package:start_car_rental/data/models/Car.dart';
import 'package:start_car_rental/presentation/pages/car_detail_page.dart';

class CarCardWidget extends StatelessWidget {
  final Car car;
  const CarCardWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CarDetailPage(),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/car_image.png',
              height: 120,
            ),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/gps.png'),
                        Text(' ${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: [
                        Image.asset('assets/images/pump.png'),
                        Text(' ${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(0)}/Hour",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
