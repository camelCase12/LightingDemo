class Raycaster {
  Ray[] rays;
  Vector position;
  
  void render() {
   for(int i = 0; i < rays.length; i++) {
    rays[i].render(); 
   }
  }
  void limitIntersections(Environment environment) { // for each ray, checks for environmental intersections and resizes the ray accordingly.
    for(int i = 0; i < rays.length; i++) {
     float shortestIntersection = 0;
     Boolean flagged = false;
     for(int j = 0; j < environment.materialVectors.length; j++) {
       if(willIntersect(environment.materialVectors[j], rays[i])) {
         if(flagged) {
           Vector newRayEndpoint = calculateIntersection(rays[i], environment.materialVectors[j]);
           Vector newRayDirection = new Vector(newRayEndpoint.x - rays[i].startPosition.x, newRayEndpoint.y - rays[i].startPosition.y);
           if(newRayDirection.Magnitude() < shortestIntersection) {
             shortestIntersection = newRayDirection.Magnitude(); 
             rays[i] = new Ray(rays[i].startPosition.x, rays[i].startPosition.y, newRayDirection);
             rays[i].endPosition = new Vector(newRayEndpoint.x, newRayEndpoint.y);
           }
         }
         else {
           flagged = true;
           Vector newRayEndpoint = calculateIntersection(rays[i], environment.materialVectors[j]);
           Vector newRayDirection = new Vector(newRayEndpoint.x - rays[i].startPosition.x, newRayEndpoint.y - rays[i].startPosition.y);
           rays[i] = new Ray(rays[i].startPosition.x, rays[i].startPosition.y, newRayDirection);
           rays[i].endPosition = new Vector(newRayEndpoint.x, newRayEndpoint.y);
           shortestIntersection = newRayDirection.Magnitude();
         }
       }
     }
    }
  }
  
  Raycaster(int rayCount, float startX, float startY) { 
    float dAngle = 2 * PI / rayCount;
    rays = new Ray[rayCount];
    float mag = sqrt(width * width + height * height);
    for(int i = 0; i < rayCount; i++) {
      float xLength = mag / cos(dAngle * i);
      float yLength = mag / sin(dAngle * i);
      rays[i] = new Ray(startX, startY, new Vector(xLength, yLength));
    }
  }
}
