// To parse this JSON data, do
// final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    String name;
    String address;
    int age;
    String image;
    String description;

    Person({
        required this.name,
        required this.address,
        required this.age,
        required this.image,
        required this.description,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        address: json["address"],
        age: json["age"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "age": age,
        "image": image,
        "description": description,
    };
}
