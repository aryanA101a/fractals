class Pair<T> {
  T x;
  T y;

  Pair(this.x, this.y);
  @override
  String toString() {
    return "{$x,$y}";
  }
}
