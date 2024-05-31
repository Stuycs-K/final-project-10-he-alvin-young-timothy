PImage img;
int ENCODE = 0;
int DECODE = 1;
int RED = 0;
int GREEN = 1;
int BLUE = 2;

int MODE = ENCODE;
int COLOR = RED;
int PLANE = 3;

void setup() {
  //size(866, 268);
  //img = loadImage("dark.png");
  //size(2048, 1536);
  //img = loadImage("scribble.png");
  size(400, 400);
  img = loadImage("blue_text.png");
  image(img, 0, 0);
  loadPixels();
  //if (MODE == DECODE){
  //  for (int i = 0; i < img.pixels.length; i++) {
  //    int c = img.pixels[i];
      
  //    // second LSB for dark.png
  //    int r = (int)red(c);
  //    int g = (int)red(c);
  //    int b = ((int)blue(c) >> 1) & 0x01;
      
  //    // outline the blue
  //    img.pixels[i] = color(0, 0, b * 255);
  //  }
  //}
  if (MODE == ENCODE){ 
    for (int i = 0; i < img.pixels.length; i++) {
      int c = img.pixels[i];
      int r = (int)red(c);
      int g = (int)green(c);
      int b = (int)blue(c);
      if (r == 255 && g == 255 && b == 255) { // if all the r,g,b values = 255(white), then turn the pixel black
        img.pixels[i] = color(0);
      } 
      else {// the color plane indicates which binary place should be on, so we take the expt of it
        if (COLOR == RED){ //red mode: if the pixel is not completely white, encode it red
          img.pixels[i] = color((int)Math.pow(2,PLANE), 0, 0);
        }
        else if (COLOR == GREEN){// green mode: if the pixel is not completely white, encode it green
          img.pixels[i] = color(0, (int)Math.pow(2,PLANE), 0);
        }
        else if (COLOR == BLUE){// blue mode: if the pixel is not completely white, encode it blue
          img.pixels[i] = color(0, 0, (int)Math.pow(2,PLANE));
        }
      }
    }
  }
  img.updatePixels();
}

void draw() {
  image(img, 0, 0);
  save("modified.png");
}
