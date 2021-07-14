/// Attach this to enum to automatically generate rawValue and fromRawValue()
class RawRepresentable {
  final Type type;

  const RawRepresentable([
    this.type = String,
  ]);
}
