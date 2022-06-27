class Vector {
  public float x, y;
  
  public void printVector() {
   print(x + "," + y); 
  }
  float Magnitude() {
   return sqrt(x*x + y*y); 
  }
  Vector(float x, float y) {
   this.x = x;
   this.y = y;
  }
  Vector() { }
}

float dotProduct(Vector v1, Vector v2) {
 return v1.x * v2.x + v1.y * v2.y; 
}
