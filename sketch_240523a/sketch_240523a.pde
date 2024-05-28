PImage img;
int ENCODE = 0;
int DECODE = 1;
int MODE = ENCODE;
void setup() {
  //size(866, 268);
  //img = loadImage("dark.png");
  size(2048, 1536);
  img = loadImage("scribble.png");
  image(img, 0, 0);
  loadPixels();
  if (MODE == DECODE){
    for (int i = 0; i < img.pixels.length; i++) {
      int c = img.pixels[i];
      
      // second LSB for dark.png
      int r = (int)red(c);
      int g = (int)red(c);
      int b = ((int)blue(c) >> 1) & 0x01;
      
      // outline the blue
      img.pixels[i] = color(0, 0, b * 255);
    }
  }
  if (MODE == ENCODE){
    for (int i = 0; i < img.pixels.length; i++) {
      int c = img.pixels[i];
      int g = (int)green(c);
      int r = (int)red(c);
      int b = (int)blue(c);
      // println("r " + r + " " + g + " " + b);
//      println(b + " " + c);
      if (r == b && b == g){
        img.pixels[i] = color(0, 0, 0);
      }
      else {
        img.pixels[i] = color(0, 0, 100);
      }
    }
  }
  img.updatePixels();
}

void draw() {
  // Display the modified image
  image(img, 0, 0);
}
