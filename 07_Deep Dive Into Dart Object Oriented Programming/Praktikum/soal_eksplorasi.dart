abstract class Shape {
  double getArea();
  double getPerimeter();
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double getArea() {
    return 3.14 * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * 3.14 * radius;
  }
}

class Square implements Shape {
  double side;

  Square(this.side);

  @override
  double getArea() {
    return side * side;
  }

  @override
  double getPerimeter() {
    return 4 * side;
  }
}

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
