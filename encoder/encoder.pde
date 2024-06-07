PImage original, edited, hidden;
int XOR = 0;
int ENCODE = 1;
int DECODE = 2;
int RED = 0;
int GREEN = 1;
int BLUE = 2;
int BLANK = 0;
int FILL = 1;

int ORIGINAL = 0;
int EDITED = 1;
int HIDDEN = 2;
int DISPLAY = ORIGINAL;

int MODE = XOR;
int COLOR = GREEN;
int PLANE = 3;
int BACKGROUND = FILL;

void setup() {
  //size(866, 268);
  //img = loadImage("dark.png");
  //size(2048, 1536);
  //img = loadImage("scribble.png");
  //size(400, 400);
  //img = loadImage("blue_text.png");
  size(980, 632);
  original = loadImage("nyc.png");
  image(original, 0, 0);
  save("original.png");
  edited = loadImage("nyc.png");
  hidden = loadImage("nyc.png");
//  image(img, 0, 0);
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
  if (MODE == XOR){
    for (int i = 0; i < edited.pixels.length; i++) {
      edited.pixels[i] = color(255);
    }
    edited.updatePixels();
    image(edited, 0, 0);
    save("edited.png");
    isXOR(original, edited, hidden);
  }
  else if (MODE == ENCODE){ 
    if (BACKGROUND == BLANK){
      for (int i = 0; i < original.pixels.length; i++) {
        int c = original.pixels[i];
        int r = (int)red(c);
        int g = (int)green(c);
        int b = (int)blue(c);
        if (r == 255 && g == 255 && b == 255) { // if all the r,g,b values = 255(white), then turn the pixel black
          hidden.pixels[i] = color(0);
        } 
        else {// the color plane indicates which binary place should be on, so we take the expt of it
          if (COLOR == RED){ //red mode: if the pixel is not completely white, encode it red
            hidden.pixels[i] = color((int)Math.pow(2,PLANE), 0, 0);
          }
          else if (COLOR == GREEN){// green mode: if the pixel is not completely white, encode it green
            hidden.pixels[i] = color(0, (int)Math.pow(2,PLANE), 0);
          }
          else if (COLOR == BLUE){// blue mode: if the pixel is not completely white, encode it blue
            hidden.pixels[i] = color(0, 0, (int)Math.pow(2,PLANE));
          }
        }
      }
    }
    else if (BACKGROUND == FILL){
      fill(0,0,0); //turns text to desired color
      textSize(50);
      textAlign(CENTER, CENTER);
      text("hidden message!", width/2, height/2);
      edited = get(); // returns the entire image 
      image(edited, 0, 0);
      save("edited.png");
      for (int i = 0; i < original.pixels.length; i ++){
        int c = original.pixels[i];
        int r = (int)red(c);
        int g = (int)green(c);
        int b = (int)blue(c);
        int c2 = edited.pixels[i];
        int r2 = (int)red(c2);
        int g2 = (int)green(c2);
        int b2 = (int)blue(c2);
        if (COLOR == RED){
          if (r2 != r && (r2&(int)Math.pow(2,PLANE)) == 0){
            r += (int)Math.pow(2,PLANE);
          }
          if ((r2&(int)Math.pow(2,PLANE)) != 0){
            r -= (int)Math.pow(2,PLANE);  
          }
        }
        else if (COLOR == GREEN){
          if (g2 != g && (g2&(int)Math.pow(2,PLANE)) == 0){
            g += (int)Math.pow(2,PLANE);
          }
          else if ((g2&(int)Math.pow(2,PLANE)) != 0){
            g -= (int)Math.pow(2,PLANE);  
          }
        }
        else if (COLOR == BLUE){
          if (b2 != b && (b2&(int)Math.pow(2,PLANE)) == 0){
            b += (int)Math.pow(2,PLANE);
          }
          else if ((b2&(int)Math.pow(2,PLANE)) != 0){
            b -= (int)Math.pow(2,PLANE);  
          }
        }
        hidden.pixels[i] = color(r,g,b);
      }
    }
  }
  hidden.updatePixels();
  image(hidden, 0, 0);
  save("hidden.png");
}

void draw() {
  PImage original = loadImage("original.png");
  PImage edited = loadImage("edited.png");
  PImage hidden = loadImage("hidden.png");
  textSize(50);
  fill(255);
  String mode = "";
  if (DISPLAY == ORIGINAL) {
    mode += "original";
    image(original, 0, 0);
  } else if (DISPLAY == EDITED) {
    if (MODE == XOR){
      fill(0);
    }
    mode += "edited";
    image(edited, 0, 0);
  } else if (DISPLAY == HIDDEN) {
    mode += "hidden";
    image(hidden, 0, 0);
  }
  textAlign(LEFT);
  text("mode: " + mode, 50, 50);
}

void keyPressed() {
  DISPLAY++;
  DISPLAY%=3; 
}

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

void alphaEncode(PImage original, PImage ref, int plane) {
  for(int index = 0; index < original.pixels.length; index++) {
    int c = original.pixels[index];
    int a = (int)alpha(c);
    int r = (int)red(c);
    int g = (int)green(c);
    int b = (int)blue(c);
    int c1 = ref.pixels[index];
    int a2 = (int)alpha(c);
    int r2 = (int)red(c);
    int g2 = (int)green(c);
    int b2 = (int)blue(c);
    if (a2 != a && (a2&(int)Math.pow(2,PLANE)) == 0){
      a += (int)Math.pow(2,PLANE);
    }
    if ((a2&(int)Math.pow(2,PLANE)) != 0){
      a -= (int)Math.pow(2,PLANE);  
    }
  }
}
