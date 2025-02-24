// To parse this JSON data, do
//
//     final logEntry = logEntryFromJson(jsonString);

import 'dart:convert';

List<LogEntry> logEntryFromJson(String str) =>
    List<LogEntry>.from(json.decode(str).map((x) => LogEntry.fromJson(x)));

String logEntryToJson(List<LogEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogEntry {
  String? userName;
  DateTime? timestamp;
  String? level;
  String? message;

  LogEntry({
    this.userName,
    this.timestamp,
    this.level,
    this.message,
  });

  factory LogEntry.fromJson(Map<String, dynamic> json) => LogEntry(
        userName:
            json["userName"] == null ? "Name not found" : json["userName"],
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        level: json["level"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "timestamp": timestamp?.toIso8601String(),
        "level": level,
        "message": message,
      };
}
