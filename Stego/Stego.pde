PImage img;
PImage modified; 

void setup() {
}


void draw() {
}


//precondition to check that the images are equal in dimension;
void XORMODE(PImage img1, PImage img2) {
  modified.loadPixels();
  img1.loadPixels();
  img2.loadPixels();
  for(int index = 0; index < img1.pixels.length; index++) {
    modified.pixels[index] = img1.pixels[index] ^ img2.pixels[index];
    }
}
