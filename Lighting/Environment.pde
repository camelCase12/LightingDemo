class Environment {
  MaterialVector[] materialVectors;
  
  void render() {
   for(int i = 0; i < materialVectors.length; i++) {
    materialVectors[i].render(); 
   }
  }
  Environment() { }
}
