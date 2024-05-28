import java.util.Arrays;
PImage img1;
PImage img2;
PImage modified; 

void setup() {
  size(img1.width, img1.height);
}


void draw() {
  image(modified, 0, 0);
}


//precondition to check that the images are equal in dimension;
boolean XORMODE(PImage img1, PImage img2) {
  modified.loadPixels();
  img1.loadPixels();
  img2.loadPixels();
  if(img1.width != img2.width && img1.height != img2.height) {
    return false;
  }
  for(int index = 0; index < img1.pixels.length; index++) {
    modified.pixels[index] = img1.pixels[index] ^ img2.pixels[index];
    }
  return true;
}

void keyPressed(){
  if (key == ' '){
    if (MODE == DIFF_B){
      MODE = DEFAULT;
    }
    else{
      MODE += 1;
    }
  }
}