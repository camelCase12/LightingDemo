float angle(Vector v) { // returns the vector's angle from the pole, between 0 and 2pi. the fact that the program does not know to consider 2pi = 0 in terms of angles,
   if(v.x > 0) { // there are a few calculation problems to address, but my intersection algorithm accounts for that.
     if(atan(v.y / v.x) < 0) {
      return 2 * PI + atan(v.y / v.x); 
     }
     else {
      return atan(v.y / v.x); 
     }
   }
   else if(v.x < 0) {
     return atan(v.y /v.x) + PI; 
   }
   else if(v.x == 0 && v.y > 0) {
    return PI / 2; 
   }
   else {
    return 3 * PI / 2; 
   }
}
