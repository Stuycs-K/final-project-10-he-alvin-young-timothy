PImage img;

void setup() {
  size(866, 268);
  img = loadImage("dark.png");
  image(img, 0, 0);
  loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    int c = img.pixels[i];
    
    // second LSB for dark.png
    int r = (int)red(c);
    int g = (int)red(c);
    int b = ((int)blue(c) >> 1) & 0x01;
    
    // outline the blue
    img.pixels[i] = color(0, 0, b * 255);
  }
  img.updatePixels();
}

void draw() {
  // Display the modified image
  image(img, 0, 0);
}
