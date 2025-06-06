class OkeyModel {
  int? id;
  List? userList;
  String? pointOne;
  String? pointTwo;
  String? date;

  OkeyModel({this.id, this.userList, this.pointOne, this.pointTwo, this.date});
  OkeyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userList = json['userList'];
    pointOne = json['pointOne'];
    pointTwo = json['pointTwo'];
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userList'] = userList;
    data['pointOne'] = pointOne;
    data['pointTwo'] = pointTwo;
    data['date'] = date;
    return data;
  }
}
