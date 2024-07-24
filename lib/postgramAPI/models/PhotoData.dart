class PhotoData {
  int id;
  String url;
  DateTime? createdAt;
  PhotoData({
    required this.id,
    required this.url,
    this.createdAt,
  });
}
