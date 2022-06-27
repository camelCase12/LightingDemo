public Boolean willIntersect(MaterialVector matVector1, Ray r) { // angle in rads (fix domain)
  MaterialVector matVectorShifted = new MaterialVector(matVector1.position.x - r.startPosition.x, matVector1.position.y - r.startPosition.y,
                                                       matVector1.direction.x, matVector1.direction.y);
  Ray rShifted = new Ray(0, 0, new Vector(r.direction.x, r.direction.y));
  rShifted.endPosition = new Vector(r.direction.x, r.direction.y);
  float boundaryAngleOne = angle(matVectorShifted.position);
  float boundaryAngleTwo = angle(matVectorShifted.endPoint());
  float rayAngle = angle(rShifted.direction);
  Boolean oneIsLower = (boundaryAngleOne < boundaryAngleTwo);
  if(abs(boundaryAngleOne - boundaryAngleTwo) > PI) {
    if(oneIsLower && ( rayAngle > boundaryAngleOne && rayAngle < boundaryAngleTwo) ||
        !oneIsLower && (rayAngle < boundaryAngleOne && rayAngle > boundaryAngleTwo)) {
         return false; 
    }
    else {
     return true; 
    }
  }
  else if((oneIsLower && (rayAngle < boundaryAngleOne || rayAngle > boundaryAngleTwo)) ||
      (!oneIsLower && (rayAngle > boundaryAngleOne || rayAngle < boundaryAngleTwo))) {
    return false;
  }
  else {
    return true; 
  }
}

public Vector calculateIntersection(Ray r, MaterialVector matVector1) {
 Vector intersection;
 float c1 = r.startPosition.x; // all of this nonsense is a copy-down of an equation I derived on paper, the solution between the intersection of any two lines in
 //2 dimensions, defined parametrically (to best fit vectors)
 float k1 = r.direction.x;
 float c2 = r.startPosition.y;
 float k2 = r.direction.y;
 float c3 = matVector1.position.x;
 float k3 = matVector1.direction.x;
 float c4 = matVector1.position.y;
 float k4 = matVector1.direction.y;
 float s1 = (k2*c3)/k1;
 float s2 = (k2*c1)/k1;
 float s3 = (k2*k3)/k1;
 float s = (c2 + s1 - s2 - c4)/(k4 - s3);
 float t1 = (k3*s);
 float t = (c3 - c1 + t1)/k1;
 float xIntersection = c1 + k1*t;
 float yIntersection = c2 + k2*t;
 intersection = new Vector(xIntersection, yIntersection);
 return intersection;
}
