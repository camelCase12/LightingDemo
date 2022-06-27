class MaterialVector {
  Vector position;
  Vector direction; // not standardized to magnitude 1
  
  Vector endPoint () {
   return new Vector(position.x + direction.x, position.y + direction.y); 
  }
  void render() {
   stroke(200, 100, 200);
   fill(200, 100, 200);
   line(position.x + width / 2, height / 2 - position.y, position.x + direction.x + width / 2, height / 2 - position.y - direction.y);
  }
  MaterialVector(float posX, float posY, float lenX, float lenY) {
   position = new Vector(posX, posY);
   direction = new Vector(lenX, lenY);
  }
  MaterialVector() { }
}
