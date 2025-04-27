class SosEvent {
  final String eventId;
  final String ownerUid;
  final DateTime startedAt;
  final String status;
  final List<String> contactIds;

  SosEvent({
    required this.eventId,
    required this.ownerUid,
    required this.startedAt,
    required this.status,
    required this.contactIds,
  });

  factory SosEvent.fromJson(Map<String, dynamic> json) {
    return SosEvent(
      eventId: json['eventId'] as String,
      ownerUid: json['ownerUid'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      status: json['status'] as String,
      contactIds: List<String>.from(json['contactIds'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'ownerUid': ownerUid,
        'startedAt': startedAt.toIso8601String(),
        'status': status,
        'contactIds': contactIds,
      };
}
