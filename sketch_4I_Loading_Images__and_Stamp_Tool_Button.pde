PImage mango;  

void setup() {
  size(600, 600);
  background(255);
  mango = loadImage("mango.jpg");  
}

void draw() {
  fill(255);
  rect (0, 0, 100, 100);
  image(mango, 0, 0, 100, 100); 
}

void mouseDragged() {
  
 
}
