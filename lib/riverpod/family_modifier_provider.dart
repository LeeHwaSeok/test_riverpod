import 'package:flutter_riverpod/flutter_riverpod.dart';

///family는 data로 매개변수를 받아옴
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async{
  await Future.delayed(Duration(seconds: 2));


  return List.generate(5, (index) => index * data);

});