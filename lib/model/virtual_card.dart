class VirtualCard {
  final String id;
  final String cardColor;
  final String cardName;
  final bool isMaster;
  final String expiry;
  final String cardNumber;
  final String pin;
  final int cvc;
  double balanceAmount;
  bool isActive;

  VirtualCard({
    required this.id,
    required this.cardColor,
    required this.cardName,
    this.isMaster = true,
    required this.pin,
    required this.expiry,
    required this.cardNumber,
    this.balanceAmount = 0.0,
    required this.cvc,
    this.isActive = false,
  });

  toggleIsActive(){
    isActive = !isActive;
  }

  switchOffIsActive(){
    isActive = false;
  }

  creditCard(double amount){
    balanceAmount += amount;
  }

  debitCard(double amount){
    balanceAmount -= amount;
  }
}
