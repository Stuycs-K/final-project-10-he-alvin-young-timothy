import java.util.Arrays;

PImage img1;
PImage img2;
PImage modified;


void setup() {
  size(288, 180);
  PImage img1 = loadImage("city.png");
  PImage img2 = loadImage("apple.png");
  println("Width: " + img1.width);
  println("Height: " + img1.height);
  img1.loadPixels();
  img2.loadPixels();
  PImage modified = createImage(img1.width, img1.height, RGB);
  isXOR(img1, img2, modified);
}


void draw() {
    // Display the modified image
    image(img1, 0, 0);
}


//precondition to check that the images are equal in dimension;
boolean isXOR(PImage img1, PImage img2, PImage modified) {
  if(img1.width != img2.width && img1.height != img2.height) {
    return false;
  }
  else {
  for(int index = 0; index < img1.pixels.length; index++) {
    modified.pixels[index] = img1.pixels[index] ^ img2.pixels[index];
    //if (img1.pixels[index] == img2.pixels[index]) 
   }
  }
  modified.updatePixels();
  return true;
}

//void keyPressed(){
//  if (key == ' '){
//    if (MODE == DIFF_B){
//      MODE = DEFAULT;
//    }
//    else{
//      MODE += 1;
//    }
//  }
//}
