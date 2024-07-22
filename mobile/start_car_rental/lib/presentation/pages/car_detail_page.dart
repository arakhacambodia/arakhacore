import 'package:flutter/material.dart';
import 'package:start_car_rental/data/models/Car.dart';
import 'package:start_car_rental/presentation/widgets/car_card_widget.dart';
import 'package:start_car_rental/presentation/widgets/more_card.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(' Information')],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: CarCardWidget(
              car: Car(model: 'Toyota Lexus', distance: 870, fuelCapacity: 80, pricePerHour: 45),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    decoration: BoxDecoration(
                        color: const Color(0xfff3f3f3),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)]),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/maps.png'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              MoreCard(
                car: Car(model: 'Toyota Lexus', distance: 870, fuelCapacity: 80, pricePerHour: 60),
              ),
              MoreCard(
                car: Car(model: 'Toyota Lexus', distance: 870, fuelCapacity: 80, pricePerHour: 45),
              ),
              MoreCard(
                car: Car(model: 'Toyota Lexus', distance: 870, fuelCapacity: 80, pricePerHour: 45),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
