//2D Raycasting experiment, rendering only rays to allow you to learn the environment.
Environment environment1;

//modifiables
Boolean drawEnvironment = true;
Boolean environmentMotion = false;

void setup() {
  size(1000, 1000);
  background(0);
  /*MaterialVector mv = new MaterialVector(50, 0, -50, 50);
  mv.render();
  Ray ray = new Ray(); //<>//
  ray.startPosition = new Vector(0, 0);
  ray.endPosition = new Vector(50, 75);
  ray.direction = new Vector(50, 75);
  ray.render();
  Vector intersection = calculateIntersection(ray, mv);
  intersection.printVector();
  ellipse(width / 2 + intersection.x, height / 2 - intersection.y, 2, 2);*/
  
  environment1 = new Environment();
  //matVectors
  MaterialVector materialVector1 = new MaterialVector(100, 50, -100, 40);
  MaterialVector materialVector2 = new MaterialVector(-100, 150, 300, 100);
  MaterialVector materialVector3 = new MaterialVector(200, -300, 100, 100);
  MaterialVector materialVector4 = new MaterialVector(-200, -200, 100, 100);
  MaterialVector materialVector5 = new MaterialVector(-100, -100, 0, -100);
  MaterialVector materialVector6 = new MaterialVector(-100, -200, -100, 0);
  MaterialVector materialVector7 = new MaterialVector(-300, 300, -100, 0);
  MaterialVector materialVector8 = new MaterialVector(-400, 300, 0, 100);
  MaterialVector materialVector9 = new MaterialVector(-400, 400, 100, 0);
  MaterialVector materialVector10 = new MaterialVector(-300, 400, 0, -100);
  environment1.materialVectors = new MaterialVector[10];
  environment1.materialVectors[0] = materialVector1;
  environment1.materialVectors[1] = materialVector2;
  environment1.materialVectors[2] = materialVector3;
  environment1.materialVectors[3] = materialVector4;
  environment1.materialVectors[4] = materialVector5;
  environment1.materialVectors[5] = materialVector6;
  environment1.materialVectors[6] = materialVector7;
  environment1.materialVectors[7] = materialVector8;
  environment1.materialVectors[8] = materialVector9;
  environment1.materialVectors[9] = materialVector10;
  //matVectors
  environment1.render();
  
  Raycaster rc = new Raycaster(30, 0, 0);
  rc.limitIntersections(environment1);
  rc.render();
}

void draw() {
  background(0);
  Raycaster rc1 = new Raycaster(137, mouseX - width / 2, height / 2 - mouseY); // set the raycount to 2000 to melt your processor
  rc1.limitIntersections(environment1);
  if(drawEnvironment) {
    environment1.render();
  }
  rc1.render();
  if(environmentMotion) {
    for(int i = 0; i < environment1.materialVectors.length; i++) {
      environment1.materialVectors[i].position.x += cos(frameCount/40.0);
    }
  }
}

void keyPressed() {
 if(key == 'w') {
  drawEnvironment = !drawEnvironment; 
 }
}
