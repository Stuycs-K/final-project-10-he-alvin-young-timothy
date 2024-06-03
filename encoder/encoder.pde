PImage img, img2;
int ENCODE = 0;
int DECODE = 1;
int RED = 0;
int GREEN = 1;
int BLUE = 2;
int BLANK = 0;
int FILL = 1;

int MODE = ENCODE;
int COLOR = RED;
int PLANE = 7;
int BACKGROUND = FILL;

void setup() {
  //size(866, 268);
  //img = loadImage("dark.png");
  //size(2048, 1536);
  //img = loadImage("scribble.png");
  //size(400, 400);
  //img = loadImage("blue_text.png");
  size(980, 632);
  img = loadImage("nyc.png");
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
    if (BACKGROUND == BLANK){
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
    else if (BACKGROUND == FILL){
      img2 = loadImage("nyc.png");
      fill(19,66,215); //turns text to blue (or desired) color
      textSize(50);
      textAlign(CENTER, CENTER);
      text("THIS SHOULD BE GREEN", width/2, height/2);
      img2 = get(); // returns the entire image 
      image(img, 0, 0);
      save("edited.png");
      for (int i = 0; i < img2.pixels.length; i ++){
        int c = img.pixels[i];
        int r = (int)red(c);
        int g = (int)green(c);
        int b = (int)blue(c);
        int c2 = img2.pixels[i];
        int r2 = (int)red(c2);
        int g2 = (int)green(c2);
        int b2 = (int)blue(c2);
        if (COLOR == RED){
          if (r2 == 255 && (r2&(int)Math.pow(2,PLANE)) == 0){
            r += (int)Math.pow(2,PLANE);
          }
          if ((r2&(int)Math.pow(2,PLANE)) != 0){
            r -= (int)Math.pow(2,PLANE);  
          }
        }
        else if (COLOR == GREEN){
          if (g2 == 255 && (g2&(int)Math.pow(2,PLANE)) == 0){
            g += (int)Math.pow(2,PLANE);
          }
          else if ((g2&(int)Math.pow(2,PLANE)) != 0){
            g -= (int)Math.pow(2,PLANE);  
          }
        }
        else if (COLOR == BLUE){
          if (b2 == 255 && (b2&(int)Math.pow(2,PLANE)) == 0){
            b += (int)Math.pow(2,PLANE);
          }
          else if ((b2&(int)Math.pow(2,PLANE)) != 0){
            b -= (int)Math.pow(2,PLANE);  
          }
        }
        img.pixels[i] = color(r,g,b);
      }
    }
  }
  img.updatePixels();
}

void draw() {
  image(img, 0, 0);
  save("modified.png");
    image(img2, 0, 0);
  noLoop();
}
