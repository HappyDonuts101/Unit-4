void setup() {
size(600, 600);
background(255);
}

void draw() {
  
}


void mouseDragged() {
 line(pmouseX, pmouseY, mouseX, mouseY);//pmouseX and pmouseY are were the mouse was 
                                        //1/60th of a frame before
}
