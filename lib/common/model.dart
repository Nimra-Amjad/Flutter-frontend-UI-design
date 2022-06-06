import 'package:flutter/material.dart';

class CardInfo {
  String bankname;
  String imgsrc;
  String cardNum;
  String name;
  bool addcard;
  String startDuration;
  String endDuration;

  CardInfo(this.bankname, this.imgsrc, this.cardNum, this.name, this.addcard,
      this.startDuration, this.endDuration);
}

class ServiceInfo {
  Icon icon;
  String title;

  ServiceInfo(this.icon, this.title);
}

class CardDetail {
  String date;
  String name;
  double pay;
  double balance;
  Icon icon;
  bool isAdd;

  CardDetail(
      this.date, this.name, this.pay, this.balance, this.icon, this.isAdd);
}

List<CardDetail> CardDetailSet = [
  CardDetail(
      "21-aug-22022",
      "Oil State",
      59.9,
      303.0,
      const Icon(
        Icons.calendar_month,
        color: Colors.white,
        size: 35,
      ),
      false),
  CardDetail(
      "21-aug-22022",
      "Remittance",
      59.9,
      303.0,
      const Icon(
        Icons.money,
        color: Colors.white,
        size: 35,
      ),
      false),
  CardDetail(
      "21-aug-22022",
      "Youtube Premium",
      59.9,
      303.0,
      const Icon(
        Icons.youtube_searched_for,
        color: Colors.white,
        size: 35,
      ),
      false),
  CardDetail(
      "21-aug-22022",
      "Subway Pyament",
      59.9,
      303.0,
      const Icon(
        Icons.bus_alert,
        color: Colors.white,
        size: 35,
      ),
      true),
  CardDetail(
      "21-aug-22022",
      "Remittance",
      59.9,
      303.0,
      const Icon(
        Icons.alarm,
        color: Colors.white,
        size: 35,
      ),
      true)
];
