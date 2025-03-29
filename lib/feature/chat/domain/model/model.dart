class Topic {
  final String message;
  final String senderId;
  final String reciverId;
  final String time;

  Topic({
    required this.reciverId,
    required this.senderId,
    required this.message,
    required this.time,
  });

  // Factory method to create a MessageModel from a Map (JSON)
  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      reciverId:map["reciverId"] ,
      senderId:map["senderId"] ,
      message: map['message'] ,
      time:map["time"],
    );
  }

  // Method to convert a MessageModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'time': time,
      "senderId":senderId,
      "reciverId":reciverId,
    };
  }
}
