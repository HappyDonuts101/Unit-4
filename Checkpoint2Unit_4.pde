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

  // Orange button
  fill(orange);
  tactileRect(100, 600, 150, 100);
  rect(100, 600, 150, 100);
  
  // Button 2 Light Red Button
  fill(lightRed);
  tactileRect(350, 600, 150, 100);
  rect(350, 600, 150,100);
  
  // Button 3 (Dark Red)
  fill(darkRed);
   tactileRect(600, 600, 150, 100);
  rect(600, 600, 150, 100);

  // Color indicator
  fill(selectedColor);
  stroke(darkestBrown);
  circle(400, 300, 300);
}//end of draw===================================================================

// Function for detecting rectangular hover
void tactileRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(white);
  } else {
    stroke(darkestBrown);
  }
}
//end tactile ======================================================================

void mouseReleased() {
  // Orange Button
   if (mouseX > 100 && mouseX < 250 && mouseY > 600 && mouseY < 700) {
    selectedColor = orange;
  }
  
  // Light Red Button
  if (mouseX>350 && mouseX<500 && mouseY>600 && mouseY < 700) {
    selectedColor = lightRed;
  }
  
  // Dark Red Button
  if (mouseX>600 && mouseX<750 && mouseY>600 && mouseY<700) {
    selectedColor = darkRed;
  }
}
