class LeadResponse {
  int status;
  List<Lead> leads;
  int leadCount;
  int pageCount;

  LeadResponse({
    required this.status,
    required this.leads,
    required this.leadCount,
    required this.pageCount,
  });

  factory LeadResponse.fromJson(Map<String, dynamic> json) {
    return LeadResponse(
      status: json['status'],
      leads: (json['leads'] as List)
          .map((leadJson) => Lead.fromJson(leadJson))
          .toList(),
      leadCount: json['leadCount'],
      pageCount: json['pageCount'],
    );
  }
}

class Lead {
  String imageURL;
  List<String> labels;
  DateTime createdAt;
  String? invoiceAddress;
  int totalAppts;
  int completedAppts;
  int totalInvoice;
  int invoiceCollectedThisMonth;
  int invoiceCollectedSoFar;
  int invoiceDueCount;
  String id;
  String notaryId;
  String email;
  String bio;
  String firstName;
  String lastName;
  String type;
  int phoneNumber;
  String city;
  int zipCode;
  String state;
  String source;
  List<dynamic> notes;
  List<dynamic> knownContacts;
  int v;

  Lead({
    required this.imageURL,
    required this.labels,
    required this.createdAt,
    required this.invoiceAddress,
    required this.totalAppts,
    required this.completedAppts,
    required this.totalInvoice,
    required this.invoiceCollectedThisMonth,
    required this.invoiceCollectedSoFar,
    required this.invoiceDueCount,
    required this.id,
    required this.notaryId,
    required this.email,
    required this.bio,
    required this.firstName,
    required this.lastName,
    required this.type,
    required this.phoneNumber,
    required this.city,
    required this.zipCode,
    required this.state,
    required this.source,
    required this.notes,
    required this.knownContacts,
    required this.v,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      imageURL: json['imageURL'],
      labels: (json['labels'] as List).cast<String>(),
      createdAt: DateTime.parse(json['createdAt']),
      invoiceAddress: json['invoiceAddress'],
      id: json['_id'],
      city: json['city'],
      email: json['email'],
      bio: json['bio'],
      completedAppts: json['completedAppts'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      invoiceCollectedSoFar: json['invoiceCollectedSoFar'],
      invoiceCollectedThisMonth: json['invoiceCollectedThisMonth'],
      invoiceDueCount: json['invoiceDueCount'],
      knownContacts: (json['knownContacts'] as List).cast<String>(),
      notaryId: json['notaryId'],
      notes: (json['notes'] as List).cast<String>(),
      phoneNumber: json['phoneNumber'],
      source: json['source'],
      state: json['state'],
      totalAppts: json['totalAppts'],
      totalInvoice: json['totalInvoice'],
      type: json['type'],
      v: json['__v'],
      zipCode: json['zipCode'],
    );
  }

}
