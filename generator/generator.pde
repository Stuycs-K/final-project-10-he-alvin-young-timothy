PImage img;

void setup() {
  size(400, 400);
  img = createImage(width, height, RGB);
  img.loadPixels();
  
  // Set all pixels to white
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(255);
  }
  
  // Set text properties
  fill(255, 0, 0); // Red color
  textSize(30);
  text("hello", width/2, height/2);
  
  img.updatePixels();
  image(img, 0, 0);
  save("red_text_on_white.png"); // Save the image
}

void draw() {
  // Display the modified image
  image(img, 0, 0);
}
