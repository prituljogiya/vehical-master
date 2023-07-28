class Vehicle {

  final String number;
  final String make;
  final String model;
  final String fuelType;
  final String transmission;

//<editor-fold desc="Data Methods">
  const Vehicle({
    required this.number,
    required this.make,
    required this.model,
    required this.fuelType,
    required this.transmission,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vehicle &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          make == other.make &&
          model == other.model &&
          fuelType == other.fuelType &&
          transmission == other.transmission);

  @override
  int get hashCode =>
      number.hashCode ^
      make.hashCode ^
      model.hashCode ^
      fuelType.hashCode ^
      transmission.hashCode;

  @override
  String toString() {
    return 'Vehicle{' +
        ' number: $number,' +
        ' make: $make,' +
        ' model: $model,' +
        ' fuelType: $fuelType,' +
        ' transmission: $transmission,' +
        '}';
  }

  Vehicle copyWith({
    String? number,
    String? make,
    String? model,
    String? fuelType,
    String? transmission,
  }) {
    return Vehicle(
      number: number ?? this.number,
      make: make ?? this.make,
      model: model ?? this.model,
      fuelType: fuelType ?? this.fuelType,
      transmission: transmission ?? this.transmission,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': this.number,
      'make': this.make,
      'model': this.model,
      'fuelType': this.fuelType,
      'transmission': this.transmission,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      number: map['number'] as String,
      make: map['make'] as String,
      model: map['model'] as String,
      fuelType: map['fuelType'] as String,
      transmission: map['transmission'] as String,
    );
  }

//</editor-fold>
}
