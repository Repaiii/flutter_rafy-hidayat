import 'Circle.dart';
import 'Rectangle.dart';
import 'Square.dart';

void main() {
  Circle circle = Circle(5.0);
  Square square = Square(4.0);
  Rectangle rectangle = Rectangle(3.0, 6.0);

  print("Luas dan Keliling Lingkaran:");
  print("Luas: ${circle.getArea()}");
  print("Keliling: ${circle.getPerimeter()}\n");

  print("Luas dan Keliling Persegi:");
  print("Luas: ${square.getArea()}");
  print("Keliling: ${square.getPerimeter()}\n");

  print("Luas dan Keliling Persegi Panjang:");
  print("Luas: ${rectangle.getArea()}");
  print("Keliling: ${rectangle.getPerimeter()}");
}