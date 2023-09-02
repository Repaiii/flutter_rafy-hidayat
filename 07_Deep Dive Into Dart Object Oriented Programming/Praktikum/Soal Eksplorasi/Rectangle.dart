import 'Shape.dart';

class Rectangle implements Shape {
  double width;
  double length;

  Rectangle(this.width, this.length);

  @override
  double getArea() {
    return width * length;
  }

  @override
  double getPerimeter() {
    return 2 * (width + length);
  }
}