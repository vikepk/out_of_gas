class Autogenerated {
  NTsT38NIpMAXLBNzrxM? nTsT38NIpMAXLBNzrxM;
  NTsT38NIpMAXLBNzrxM? nTsTDPUw03r2eINb9Fd;

  Autogenerated({this.nTsT38NIpMAXLBNzrxM, this.nTsTDPUw03r2eINb9Fd});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    nTsT38NIpMAXLBNzrxM = json['-NTsT38NIpMAXLBNzrxM'] != null
        ? new NTsT38NIpMAXLBNzrxM.fromJson(json['-NTsT38NIpMAXLBNzrxM'])
        : null;
    nTsTDPUw03r2eINb9Fd = json['-NTsTDPUw03r2eINb9Fd'] != null
        ? new NTsT38NIpMAXLBNzrxM.fromJson(json['-NTsTDPUw03r2eINb9Fd'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nTsT38NIpMAXLBNzrxM != null) {
      data['-NTsT38NIpMAXLBNzrxM'] = this.nTsT38NIpMAXLBNzrxM!.toJson();
    }
    if (this.nTsTDPUw03r2eINb9Fd != null) {
      data['-NTsTDPUw03r2eINb9Fd'] = this.nTsTDPUw03r2eINb9Fd!.toJson();
    }
    return data;
  }
}

class NTsT38NIpMAXLBNzrxM {
  String? number;
  String? petrolQuantity;
  String? name;
  String? petrolType;
  String? location;

  NTsT38NIpMAXLBNzrxM(
      {this.number,
      this.petrolQuantity,
      this.name,
      this.petrolType,
      this.location});

  NTsT38NIpMAXLBNzrxM.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    petrolQuantity = json['petrol_quantity'];
    name = json['name'];
    petrolType = json['petrol_type'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['petrol_quantity'] = this.petrolQuantity;
    data['name'] = this.name;
    data['petrol_type'] = this.petrolType;
    data['location'] = this.location;
    return data;
  }
}
