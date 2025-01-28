import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EqutableTesting extends StatefulWidget {
  const EqutableTesting({super.key});

  @override
  State<EqutableTesting> createState() => _EqutableTestingState();
}

class _EqutableTestingState extends State<EqutableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = Person(name: 'Harry', age: 20);
          Person person1 = Person(name: 'Harry', age: 20);

          print(person.hashCode.toString());
          print(person1.hashCode.toString());

          print(person == person1);

          // print(person == person1);
          // print(person == person);
        },
      ),
    );
  }
}

class Person extends Equatable{
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override

  List<Object?> get props => [name,age];




  /// old method without use of equtable pakage
  // @override
  // bool operator ==(Object other) {
  //   return identical(this, other) ||
  //       other is Person &&
  //           runtimeType == other.runtimeType &&
  //           name == other.name &&
  //           age == other.age;
  // }
  //
  // @override
  // // TODO: implement hashCode
  // int get hashCode => name.hashCode ^ age.hashCode;
}
