PImage img;
int ENCODE = 0;
int DECODE = 1;
int MODE = ENCODE;
void setup() {
  //size(866, 268);
  //img = loadImage("dark.png");
  //size(2048, 1536);
  //img = loadImage("scribble.png");
  size(400, 400);
  img = loadImage("red_text.png");
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
      int r = (int)red(c);
      int g = (int)green(c);
      int b = (int)blue(c);
      if (r == 255 && g == 255 && b == 255) {
        img.pixels[i] = color(0);
      } else {
        img.pixels[i] = color(0, 0, 2);
      }
    }
  }
  img.updatePixels();
}
void draw() {
  image(img, 0, 0);
  save("modified.png");
}
