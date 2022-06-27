class Ray {
  Vector startPosition;
  Vector endPosition;
  Vector direction;
  
  void render() {
   stroke(255);
   fill(255);
   line(startPosition.x + width / 2, height / 2 - startPosition.y, startPosition.x + direction.x + width / 2, height / 2 - startPosition.y - direction.y);
  }
  Ray(float startX, float startY, Vector direction) {
   startPosition = new Vector(startX, startY);
   this.direction = new Vector(direction.x, direction.y);
   endPosition = new Vector(startPosition.x + direction.x, startPosition.y + direction.y);
  }
  Ray() { }
}
