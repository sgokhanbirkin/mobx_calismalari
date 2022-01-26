abstract class Basemodel<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, Object> json);
}
