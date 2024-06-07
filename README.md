[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ecp4su41)
# THIS DOCUMENT IS REQUIRED

## Group Info
Alvin He, Timothy Young
Period 10

## Overview

## Steganography: A Brief History

Although cryptography and encryptions have been around since medieval times, steganography takes a different approach to this idea of encoded messages by making the hidden message itself discreet. Although encryption merely ensures the security of the hidden message, steganography relies more upon the theory of hiding in plain sent, obscuring the fact that the message itself has been sent by the human brain's amazing ability to filter seemingly irrelevant information. The term steganography, or the art of hiding messages within mediums in plain sight, was first used in 1499 by German abbot Johannes Trithemius, the father of cryptography and steganography. In his Steganographia, he detailed these principles using shopping lists and letters as ruses to cover the messages written in invisible ink between the margins. 

However, Kurak and McHugh are the first to propose the idea of digital steganography. With the turn of the digital age, they argued that three main factors set steganography apart; it's ability to remain undetected, robustness(resistance to decryption through various image processing techniques), and capacity of message. They experimented with image downgrading and image contamination, quite resembling our LSB encryption lab in Processing!

Steganography Applications:

Steganography Methods: GIF, JPEG, PNG
Besides the form of LSB Steganography that we've been acquainted with.

### Color Planes and Differences between ARGB Planes
We created our project using Processing, and we decided upon the PNG format because it allows for lossless conversion, ensuring that our encoded image will not lose acuity despite the number of times we encode and save our image, unlike JPEG. In Processing, images are initialized with their specific dimensions and with RGB channels(alpha channel ignored) or with ARGB(with transparency mode included). As we loop through each pixel in the pixel[] of the target image, we can access these RGB channels for each specific pixel. A color value of (0,0,0) indicates a black pixel, whereas (255,255,255) indicates white, with each value dictating how much of each primary color comprises the pixel's color. 

As these values range from 0-255, it is easy to decompose them into binary in the form of 8 bits that can enumerate any value within our range. Stegsolve uses eight total color planes for each color (r,g,b), in which one is the base color, and the other 7 planes are variations. The way that the color channels work is that if the color's nth bit from the right is equal to one, that pixel will appear as white in that specified plane. On the other hand, if the nth bit from the right is equal to zero, the pixel will appear as black on the specified plane. 

Alpha, on the other hand, 


## XOR 
XOR, or exclusive OR, works exceptionally well in binary situations. Binary operates in base 2, using only zeroes and ones. By looking and comparing each place of our original binary and a encoding binary, XOR will return 1 if the two values differ(0 and 1), and false if the two values are the same (0,0) or (1,1). 

//Insert XOR Example HERE:
Take, for instance, this binary sequence

Now, if we xor it with the message string:

We get:


## Encryption Technique (Using LSB and XOR)
For our encoder, we masked text into specific bits of an image so that the text will only be visible through Stegsolve planes. To do so, we masked an image with the same image with text to produce an image that looks nearly identical to the original. To encode text so that they can be viewed only on specific planes, we altered the bits of a pixel's color channel to turn on and off specific planes. Since the least significant bit is the rightmost bit, as the planes increase, the more visibily different the encoded image will be. If each pixel has a color channel value between 0 and 255 produced from the 8 bits, the most significant bit (the right most bit) will account for half of the color sharpness.

## Hiding Images Within A Full Image

## Instructions

## Code Compilation and Makefile Usage

## TryHackMe Room Implementation

Sources:
https://www.sciencedirect.com/science/article/abs/pii/S0165168409003648
Image Downgrading: https://www.petitcolas.net/steganography/image_downgrading/

Proposed Idea: Use image steganography on some of the image we include in the README


