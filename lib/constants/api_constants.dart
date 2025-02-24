import 'package:flutter/material.dart';

class ApiConstants{
  static const baseUrl = "http://98.81.113.93:5000";
  static const register = "$baseUrl/api/auth/register";
  static const sendOTP = "$baseUrl/api/auth/send-otp";

}