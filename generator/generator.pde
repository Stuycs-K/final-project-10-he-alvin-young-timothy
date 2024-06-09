int rgb = 0;
int alpha = 1;
int MODE = alpha;

PImage img;

void setup() { //initializes a new image using RGB
  size(400, 400);
//size(288, 180);
  if (MODE == rgb) {
    img = createImage(width, height, RGB);
  }
  if (MODE == alpha) {
    img = createImage(width, height, ARGB);
  }
  img.loadPixels();
}

void draw() {// Creates a white background, and creates text 
  if (MODE == rgb) {
  background(255);
  fill(0, 0, 255); //turns text to blue (or desired) color
  textSize(30);
  textAlign(CENTER, CENTER);
  text("this should be blue", width/2, height/2);
  img = get(); // returns the entire image 
  image(img, 0, 0);
  save("blue_text.png");
//  save("white.png");
  }
  if (MODE == alpha) {
    background(255);
    fill(0, 0, 255); //turns text to blue (or desired) color
    textSize(30);
    textAlign(CENTER, CENTER);
    text("this should be alpha", width/2, height/2);
    img = get(); // returns the entire image 
    image(img, 0, 0);
    save("blue_text.png");
  }
}
