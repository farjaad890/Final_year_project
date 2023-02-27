import 'dart:core';

class person {
  late String email;
  late String pass;
  person(String email,String pass){
    this.email=email;
    this.pass=pass;
  }
}

List<person> persons=[
  person("farjaad890@gmail.com", "12345"),
  person("bilal890@gmail.com", "123456"),
  person("hamza890@gmail.com", "1234567"),
];