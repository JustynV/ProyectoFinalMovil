import 'package:firebase_database/firebase_database.dart';

import 'package:hive/hive.dart';

part "local_message.g.dart";

@HiveType(typeId: 1)
class LocalMessage extends HiveObject {
  @override
  @HiveField(0)
  String? key;
  @HiveField(1)
  String msg;
  @HiveField(2)
  String senderUid;
  @HiveField(3)
  String senderName;
  @HiveField(4)
  int onRemote;

  LocalMessage(this.key, this.msg, this.senderUid, this.senderName,this.onRemote);

  LocalMessage.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        senderUid = json['senderUid'] ?? "senderUid",
        msg = json['msg'] ?? "msg",
        senderName = json['senderName'] ?? "noname",
        onRemote = json['onRemote'] ?? 0;

  toJson() {
    return {
      "msg": msg,
      "senderUid": senderUid,
      'senderName' : senderName,
    };
  }
}
