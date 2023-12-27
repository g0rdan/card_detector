class CreditCard {
  const CreditCard({
    this.cardNumber,
    this.cardHolderName,
    this.expiryDate,
  });

  final String? cardNumber;
  final String? cardHolderName;
  final String? expiryDate;

  bool get isEmpty {
    return cardNumber == null && cardHolderName == null && expiryDate == null;
  }

  CreditCard copyWith({
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
  }) {
    return CreditCard(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  String toString() {
    return 'CreditCard(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditCard &&
        other.cardNumber == cardNumber &&
        other.cardHolderName == cardHolderName &&
        other.expiryDate == expiryDate;
  }

  @override
  int get hashCode {
    return cardNumber.hashCode ^ cardHolderName.hashCode ^ expiryDate.hashCode;
  }
}
