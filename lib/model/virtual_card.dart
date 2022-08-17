class VirtualCard {
  final int id;
  final String cardColor;
  final String cardName;
  final bool isMaster;
  final String expiry;
  final String cardNumber;
  final String cvc;
  bool isActive;

  VirtualCard({
    required this.id,
    required this.cardColor,
    required this.cardName,
    this.isMaster = true,
    required this.expiry,
    required this.cardNumber,
    required this.cvc,
    this.isActive = false,
  });

  toggleIsActive(){
    isActive = !isActive;
  }

  switchOffIsActive(){
    isActive = false;
  }
}
