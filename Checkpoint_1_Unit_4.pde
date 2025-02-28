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

// Variable for color selection
color selectedColor;

void setup() {
  size(800, 800);
  strokeWeight(5);
  selectedColor = darkRed;
} 

void draw() {
  background(cream);

  tactile (100,500,50);
  fill(orange);
  circle(100, 700, 100);

  // Button 2 Light Red)
  tactile (400, 700, 50);
  fill(lightRed);
  circle(400, 700, 100);

  // Button 3 Rark Red
  tactile (700, 700, 50);
  fill(darkRed);
  circle(700, 700, 100);

  // Color indicator
  fill(selectedColor);
  stroke(darkestBrown);
  square(300, 100, 400);
}//end of draw===================================================================

void tactile (int x, int y, int r) {
   if (dist(x, y, mouseX, mouseY) < r) {
    stroke(white);
  } else {
    stroke(darkestBrown);
  }
}//end tactile ======================================================================

void mouseReleased() {
  // orange
  if (dist(100, 700, mouseX, mouseY) < 50) {
    selectedColor = orange;
  }
  
  // LightRed
  if (dist(400, 700, mouseX, mouseY) < 50) {
    selectedColor = lightRed;
  }
  
  // darkRed
  if (dist(700, 700, mouseX, mouseY) < 50) {
    selectedColor = darkRed;
  }
}
