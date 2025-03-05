// Checkpoint 1: Circle Buttons, Videos A, B, C. 
// Checkpoint 2: Rect Buttons Video D. 
// Checkpoint 3: Sliders Video E

// Palette of colors
color cream = #FEF4C0;
color orange = #FDB10B;
color lightRed = #FD292F;
color darkRed = #B20000;
color darkestBrown = #B93953;
color white = #FFFFFF;

float sliderY; 
float thickness;

void setup() {
  size(800, 600);
  strokeWeight(5);
  stroke(orange);
  fill(orange);
  sliderY = 300; 
  thickness = 0;
}

void draw() {
  background(thickness);
  

  thickness = map(sliderY, 100, 500, 0, 250);

  
  stroke(0);
  line(400, 100, 400, 500);  
  
 
  fill(orange);
  stroke(orange);
  circle(400, sliderY, 50); 
}

void mouseDragged() { 
  if (mouseY > 100 && mouseY < 500 && mouseX > 375 && mouseX < 425) {
    sliderY = mouseY;
  }
}
