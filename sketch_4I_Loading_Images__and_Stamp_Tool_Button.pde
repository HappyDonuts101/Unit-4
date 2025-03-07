PImage strawberry;
boolean strawberryOn; // true or false

void setup() {
  size(600, 600);
  background(255);
  strawberry = loadImage("strawberry.png");
  strawberryOn = true;
}

void draw() {
  fill(255);
  
  //toolbar
  stroke(0);
  strokeWeight(1);
  fill(100);
  rect(0, 0, 600, 125);
  
  //durian button
  tactile(0, 0, 100, 100);
  strawberryOnOff();
  rect(0, 0, 100, 100);
  image(strawberry, 0, 0, 100, 100);
}

void mouseDragged() {
  if (strawberryOn == false) {
    // squiggly lines
    strokeWeight(5);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    // strawberry drawing
    image(strawberry, mouseX, mouseY, 100, 100);
  }
}

void mouseReleased() {
  //strawberry button
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100) {
    strawberryOn = !strawberryOn;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(255, 255, 0);  
  } else {
    fill(255);  
  }
}

void strawberryOnOff() {
  if (strawberryOn == true) { 
    stroke(255, 0, 0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}
