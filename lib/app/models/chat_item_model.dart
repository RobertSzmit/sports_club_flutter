import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sports_club_flutter/app/features/chat/timestamp_converter.dart';

part 'chat_item_model.g.dart';

@JsonSerializable()
class ChatItem {
  ChatItem({
    required this.id,
    required this.message,
    required this.userId,
    required this.username,
    required this.timestamp,
  });

  final String id;

  final String message;

  final String userId;

  final String username;

  @TimestampConverter()
  final Timestamp timestamp;

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChatItemToJson(this);
}
