// Paint App, Ethan Song 2025 3-10

// Global variables
PImage strawberry; 
boolean stampOn = false; // Stamp tool 
boolean eraserOn = false; // Eraser tool
color selectedColor = color(0); // Currently selected color 
float strokeWeightValue = 5; 
float sliderX = 100; // Slider 

//Color variables
color blue = #0000FF;
color purple = #A020F0;
color green = #00FF00;
color pink = #FFC0CB;
color red = #FF0000;
color orange = #FFA500;
color yellow = #FFFF00;
color maroon = #800000;

void setup() {
size(1000, 800); // 
background(255); // 
strawberry = loadImage("strawberry.png"); 
}

void draw() {
drawToolbar(); 
drawCanvas(); 
}

// Toolbar
void drawToolbar() {
// Toolbar background
fill(200); 
noStroke(); 
rect(0, 0, 200, 800); 

//Seperation line between toolbar and canvas
stroke(0); 
strokeWeight(2);
line(200, 0, 200, 800); 

// Color buttons
fill(blue); // Blue button
tactileRect(50, 50, 100, 30); 
rect(50, 50, 100, 30); 

fill (purple); // Purple button
tactileRect(50, 100, 100, 30);
rect(50, 100, 100, 30);

fill(#green); // Green button
tactileRect(50, 150, 100, 30);
rect(50, 150, 100, 30);

fill(pink); // Pink button
tactileRect(50, 200, 100, 30);
rect(50, 200, 100, 30);

fill(#red); // Red
tactileRect(50, 250, 100, 30);
rect(50, 250, 100, 30);

fill(#orange); // Orange
tactileRect(50, 300, 100, 30);
rect(50, 300, 100, 30);

fill(yellow); // Yellow button
tactileRect(50, 350, 100, 30);
rect(50, 350, 100, 30);

fill(maroon); // Maroon button
tactileRect(50, 400, 100, 30);
rect(50, 400, 100, 30);

//Thickness slider
fill(150); 
rect(50, 500, 100, 10); 
fill(100); 
circle(sliderX, 505, 20); 

//Stamp button
tactileRect(50, 550, 100, 50); 
fill(255); 
rect(50, 550, 100, 50); 
image(strawberry, 50, 550, 100, 50); 

// Eraser button
tactileRect(50, 620, 100, 30); 
fill(255); 
rect(50, 620, 100, 30); 
fill(0); 
textSize(16); 
text("Eraser", 70, 640); // Text for eraser.

//  New, Save, and Load buttons

// New button
tactileRect(50, 660, 100, 30); 
fill(255); 
rect(50, 660, 100, 30); 
fill(0); 
text("New", 80, 680); // Draw the "New" text

// Save button
tactileRect(50, 700, 100, 30);
fill(255); 
rect(50, 700, 100, 30); 
fill(0); 
text("Save", 80, 720); 

// Load button
tactileRect(50, 740, 100, 30); 
fill(255); 
rect(50, 740, 100, 30); 
fill(0); // Black text
text("Load", 80, 760); 
}

//FUnction for canvas drawings
void drawCanvas() {
// Check if the mouse is pressed and on the canvas.
if (mousePressed && mouseX > 200) {
  if (stampOn) {
    // Stamp mode, draw strawberry image in the mouse position.
    image(strawberry, mouseX - 25, mouseY - 25, 50, 50);
  } else if (eraserOn) {
    // Eraser
    stroke(255);
    strokeWeight(strokeWeightValue * 2); //Makes eraser thicker
    line(pmouseX, pmouseY, mouseX, mouseY); 
  } else {
    // Squiggly line: draw line with the selected color
    stroke(selectedColor); 
    strokeWeight(strokeWeightValue); 
    line(pmouseX, pmouseY, mouseX, mouseY); 
  }
}
}

//Makes button tactile
void tactileRect(int x, int y, int w, int h) {
// Check if the mouse is on the button.
if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
  stroke(255, 0, 0); 
} else {
  stroke(0); 
}
}

// Checks for mouse clicks
void mouseReleased() {
if (mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 80) {
  selectedColor = color(0, 0, 255); // Blue
  stampOn = false; //No stamp mode
  eraserOn = false; //No eraser mode
}
if (mouseX > 50 && mouseX < 150 && mouseY > 100 && mouseY < 130) {
  selectedColor = color(128, 0, 128); // Purple
  stampOn = false; 
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 150 && mouseY < 180) {
  selectedColor = color(0, 255, 0); // Green
  stampOn = false;
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 200 && mouseY < 230) {
  selectedColor = color(255, 192, 203); // Pink
  stampOn = false;
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 250 && mouseY < 280) {
  selectedColor = color(255, 0, 0); // Red
  stampOn = false;
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 300 && mouseY < 330) {
  selectedColor = color(255, 165, 0); // Orange
  stampOn = false;
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 350 && mouseY < 380) {
  selectedColor = color(255, 255, 0); // Yellow
  stampOn = false;
  eraserOn = false;
}
if (mouseX > 50 && mouseX < 150 && mouseY > 400 && mouseY < 430) {
  selectedColor = color(0, 255, 255); // Maroon
  stampOn = false;
  eraserOn = false;
}

// Stamp button click
if (mouseX > 50 && mouseX < 150 && mouseY > 550 && mouseY < 600) {
  stampOn = !stampOn; // Use stamp
  eraserOn = false; // Turn off eraser mode
}

//Eraser button click
if (mouseX > 50 && mouseX < 150 && mouseY > 620 && mouseY < 650) {
  eraserOn = !eraserOn; // Use eraser mode
  stampOn = false; 
}

// New Button Function
if (mouseX > 50 && mouseX < 150 && mouseY > 660 && mouseY < 690) {
  background(255); //Clears canvas by setting background to white.
}

// Save button functino
if (mouseX > 50 && mouseX < 150 && mouseY > 700 && mouseY < 730) {
  save("painting.png");
  println("Canvas saved as painting.png");
}

// Handle Load button click
if (mouseX > 50 && mouseX < 150 && mouseY > 740 && mouseY < 770) {
  PImage loadedImage = loadImage("painting.png"); // Load the saved image
  if (loadedImage == null) {
    println("No saved image found."); // Print error if no image is found
  } else {
    background(255); // Clear the canvas before loading
    image(loadedImage, 200, 0); 
    println("Canvas loaded from painting.png");
  }
}
}

//Slider movement
void mouseDragged() {
if (mouseX > 50 && mouseX < 150 && mouseY > 500 && mouseY < 510) {
  sliderX = mouseX; 
  strokeWeightValue = map(sliderX, 50, 150, 1, 20); // Slider position changes thickness
}
}
