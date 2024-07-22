import 'package:flutter/material.dart';
import 'package:start_car_rental/data/models/Car.dart';
import 'package:start_car_rental/presentation/widgets/car_card_widget.dart';

class CarListPage extends StatelessWidget {
  CarListPage({super.key});
  final List<Car> cars = [
    Car(
        model: 'Toyota Lexus',
        distance: 870,
        fuelCapacity: 80,
        pricePerHour: 45),
    Car(
        model: 'Toyota Lexus',
        distance: 870,
        fuelCapacity: 80,
        pricePerHour: 45),
    Car(
        model: 'Toyota Lexus',
        distance: 870,
        fuelCapacity: 80,
        pricePerHour: 45),
    Car(
        model: 'Toyota Lexus',
        distance: 870,
        fuelCapacity: 80,
        pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Choose Your Car',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: CarCardWidget(
              car: cars[index],
            ),
          );
        },
      ),
    );
  }
}
