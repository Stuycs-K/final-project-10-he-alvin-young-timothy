import java.util.Arrays;
int DEFAULT = 0;
int XOR = 1;
int ALPHAMODE = 2;
int MODE = DEFAULT;

PImage img1;
PImage img2;
PImage modified;
PImage alphaPic;

void setup() {
  size(288, 180);
  img1 = loadImage("city.png");
  img2 = loadImage("apple.png");
  //println("Width: " + img1.width);
  //println("Height: " + img1.height);
  img1.loadPixels();
  img2.loadPixels();
  modified = createImage(img1.width, img1.height, RGB);
  alphaPic = createImage(img1.width, img1.height, ARGB);
  isXOR(img1, img2, modified);
}


void draw() {
    // Display the modified image
    image(modified, 0, 0);
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

int[] messageArr(PImage img, String message) {
  int[] arr = new int[message.length() * 4];
      int count = 0;
    for(int index = 0; index < message.length(); index++) {
      char in = message.charAt(index);
      String bin = String.format("%8s", Integer.toBinaryString(in)).replaceAll(" ", "0");
      //System.out.println(bin);
      for(int i = 0; i < bin.length(); i += 2) {
        String val = bin.substring(i, i + 2); 
        if(val.equals("00")) {
          //System.out.print(0);
          arr[count] = 0;
        }
        if(val.equals("01")) {
          //System.out.print(1);
          arr[count] = 1;
        }
        if(val.equals("10")) {
          //System.out.print(2);
          arr[count] = 2;
        }
        if(val.equals("11")) {
          //System.out.print(3);
          arr[count] = 3;
        }
        count++;
      }
    }
  return arr;
}


//maybe I can make a generalized method to do different things based on the mode 
PImage alphaMode(PImage img, int[]messageArr, PImage final) {
  img.loadPixels();
    int numPix = messageArray.length;
    for(int index = 0; index < numPix; index++) {
      color c = img.pixels[index];
      int codeAlpha = (int) alpha(c);
      String bin = String.format("%8s", Integer.toBinaryString(codeAlpha)).replaceAll(" ", "0");
      //System.out.println(bin);
      String encodedBin = "";
      if (messageArray[index] == 0) encodedBin = bin.substring(0, 6) + "00";
      if (messageArray[index] == 1) encodedBin = bin.substring(0, 6) + "01";
      if (messageArray[index] == 2) encodedBin = bin.substring(0, 6) + "10";
      if (messageArray[index] == 3) encodedBin = bin.substring(0, 6) + "11";
      //System.out.println("hi");

      img.pixels[index] = color(unbinary(encodedBin), red(c), green(c), blue(c));
    }
    for(int end = 0; end < 4; end++) {
      color c = img.pixels[end + numPix];
      int codeAlpha = (int) alpha(c);
      String bin = String.format("%8s", Integer.toBinaryString(codeRed)).replaceAll(" ", "0");
      String endChars = bin.substring(0, 6) + "11";
      img.pixels[end + numPix] = color(unbinary(endChars), red(c), green(c), blue(c));
    }
    img.updatePixels();
}

void keyPressed(){
  if (key == ' '){
    if (MODE == ALPHAMODE){
      MODE = DEFAULT;
    }
    else{
      MODE += 1;
    }
  }
}
