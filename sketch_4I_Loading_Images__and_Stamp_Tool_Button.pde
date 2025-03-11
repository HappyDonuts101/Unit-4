// Simple Paint App in Processing
// Features: 8 vibrant colors, thickness slider, stamp tool, New/Save/Load buttons

// Global variables
PImage strawberry; // Image for stamp tool
boolean stampOn = false; // Toggle stamp tool
color selectedColor = color(0); // Default color is black
float strokeWeightValue = 5; // Default stroke thickness
float sliderX = 100; // Slider position (left to right)
PGraphics canvas; // Separate graphics buffer for the canvas

void setup() {
  size(1000, 800);
  background(255);
  strawberry = loadImage("strawberry.png"); // Load strawberry image

  // Create a separate graphics buffer for the canvas
  canvas = createGraphics(width - 200, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {
  drawToolbar(); // Draw the toolbar on the left side
  drawCanvas(); // Handle drawing on the canvas
}

void drawToolbar() {
  // Draw toolbar background
  fill(200);
  noStroke();
  rect(0, 0, 200, height);

  // Draw separator line
  stroke(0);
  strokeWeight(2);
  line(200, 0, 200, height);

  // Draw 8 vibrant color buttons
  color[] colors = {
    color(0, 0, 255), // Blue
    color(128, 0, 128), // Purple
    color(0, 255, 0), // Green
    color(255, 192, 203), // Pink
    color(255, 0, 0), // Red
    color(255, 165, 0), // Orange
    color(255, 255, 0), // Yellow
    color(0, 255, 255) // Cyan
  };

  // Loop through colors using a simpler counter
  int counter = 0;
  while (counter < colors.length) {
    fill(colors[counter]);
    tactileRect(50, 50 + counter * 50, 100, 30); // Tactile effect
    rect(50, 50 + counter * 50, 100, 30); // Draw color button
    counter = counter + 1; // Increment counter
  }

  // Draw thickness slider (left to right)
  fill(150);
  rect(50, 500, 100, 10); // Slider track
  fill(100);
  circle(sliderX, 505, 20); // Slider handle

  // Draw stamp button
  tactileRect(50, 550, 100, 50); // Tactile effect
  fill(255);
  rect(50, 550, 100, 50); // Stamp button background
  image(strawberry, 50, 550, 100, 50); // Draw strawberry image

  // Draw New, Save, Load buttons
  tactileRect(50, 620, 100, 30); // New button
  fill(255);
  rect(50, 620, 100, 30);
  fill(0);
  textSize(16);
  text("New", 80, 640);

  tactileRect(50, 660, 100, 30); // Save button
  fill(255);
  rect(50, 660, 100, 30);
  fill(0);
  text("Save", 80, 680);

  tactileRect(50, 700, 100, 30); // Load button
  fill(255);
  rect(50, 700, 100, 30);
  fill(0);
  text("Load", 80, 720);
}

void drawCanvas() {
  // Display the canvas buffer
  image(canvas, 200, 0);

  // Draw on canvas (right side of the screen)
  if (mousePressed && mouseX > 200) {
    if (stampOn) {
      // Stamp mode
      canvas.beginDraw();
      canvas.image(strawberry, mouseX - 225, mouseY - 25, 50, 50); // Draw strawberry
      canvas.endDraw();
    } else {
      // Squiggly line mode
      canvas.beginDraw();
      canvas.stroke(selectedColor);
      canvas.strokeWeight(strokeWeightValue);
      canvas.line(pmouseX - 200, pmouseY, mouseX - 200, mouseY); // Draw squiggly line
      canvas.endDraw();
    }
  }
}

void tactileRect(int x, int y, int w, int h) {
  // Highlight button on hover
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    stroke(255, 0, 0); // Red border on hover
  } else {
    stroke(0); // Black border
  }
}

void mouseReleased() {
  // Handle color button clicks
  color[] colors = {
    color(0, 0, 255), // Blue
    color(128, 0, 128), // Purple
    color(0, 255, 0), // Green
    color(255, 192, 203), // Pink
    color(255, 0, 0), // Red
    color(255, 165, 0), // Orange
    color(255, 255, 0), // Yellow
    color(0, 255, 255) // Cyan
  };

  // Loop through colors using a simpler counter
  int counter = 0;
  while (counter < colors.length) {
    if (mouseX > 50 && mouseX < 150 && mouseY > 50 + counter * 50 && mouseY < 80 + counter * 50) {
      selectedColor = colors[counter]; // Set selected color
      stampOn = false; // Turn off stamp mode
    }
    counter = counter + 1; // Increment counter
  }

  // Handle stamp button click
  if (mouseX > 50 && mouseX < 150 && mouseY > 550 && mouseY < 600) {
    stampOn = !stampOn; // Toggle stamp mode
  }

  // Handle New button click
  if (mouseX > 50 && mouseX < 150 && mouseY > 620 && mouseY < 650) {
    canvas.beginDraw();
    canvas.background(255); // Clear canvas
    canvas.endDraw();
  }

  // Handle Save button click
  if (mouseX > 50 && mouseX < 150 && mouseY > 660 && mouseY < 690) {
    canvas.save("painting.png"); // Save canvas as image
    println("Canvas saved as painting.png");
  }

  // Handle Load button click
  if (mouseX > 50 && mouseX < 150 && mouseY > 700 && mouseY < 730) {
    PImage loadedImage = loadImage("painting.png");
    if (loadedImage == null) {
      println("No saved image found.");
    } else {
      canvas.beginDraw();
      canvas.image(loadedImage, 0, 0); // Load and display saved image
      canvas.endDraw();
      println("Canvas loaded from painting.png");
    }
  }
}

void mouseDragged() {
  // Adjust slider position (left to right)
  if (mouseX > 50 && mouseX < 150 && mouseY > 500 && mouseY < 510) {
    sliderX = mouseX; // Update slider position
    strokeWeightValue = map(sliderX, 50, 150, 1, 20); // Map slider to thickness
  }
}
