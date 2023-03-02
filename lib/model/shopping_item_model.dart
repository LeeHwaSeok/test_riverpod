class ShoppingItemModel {
  //이름
  final String name;
  // 갯수
  final int quantity;
// 구매했는지
  final bool hasBought;

// 매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.hasBought,
    required this.isSpicy,
    required this.quantity,
  });

  /// toggle처럼 특정 element만 변경할 때 사용
  ShoppingItemModel copyWith({
    /// optional로 데이터 받아오기
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    /// 입력된 값만 변경, 안입력되면 원래값
    return ShoppingItemModel(name: name ?? this.name,
        hasBought: hasBought ?? this.hasBought,
        isSpicy: isSpicy ?? this.isSpicy,
        quantity: quantity ?? this.quantity);
  }
}
