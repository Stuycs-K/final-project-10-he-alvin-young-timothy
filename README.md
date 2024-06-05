[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/ecp4su41)
# THIS DOCUMENT IS REQUIRED

## Group Info
Alvin He, Timothy Young
Period 10

## Overview

## Steganography: A Brief History

Although cryptography and encryptions have been around since medieval times, steganography takes a different approach to this idea of encoded messages by making the hidden message itself discreet. Although encryption merely ensures the security of the hidden message, steganography relies more upon the theory of hiding in plain sent, obscuring the fact that the message itself has been sent by the human brain's amazing ability to filter seemingly irrelevant information. The term steganography, or the art of hiding messages within mediums in plain sight, was first used in 1499 by German abbot Johannes Trithemius, the father of cryptography and steganography. In his Steganographia, he detailed these principles, using shopping lists and letters as ruses to cover the messages written in invisible ink between the margins. 

 Kurak and McHugh are the first to propose the idea of digital steganography. 

### Color Planes and Differences between ARGB Planes
We created our project using Processing, in which images are initialized with RGB channels(alpha channel ignored) or with ARGB(with transparency mode included). As we loop through each pixel in the pixel[] of the target image, we can access these RGB channels for each specific pixel. A color value of (0,0,0) indicates a black pixel, whereas (255,255,255) indicates white, with each value dictating how much of each primary color comprises the pixel's color. 

As these values range from 0-255, it is easy to decompose them into binary in the form of 8 bits that can enumerate any value within our range. There are eight total color planes for each color, in which one is the base color, and the other 7 planes are variations. The way that the color channels work is that if the binary version of the color has a one in that place value, then that pixel will appear in said plane. 

Alpha, on the other hand, 


## XOR 



## Encryption Technique (Uing LSB and XOR)

## Hiding Images Within A Full Image

## Instructions

## Code Compilation and Makefile Usage

## TryHackMe Room Implementation

Sources:
https://www.sciencedirect.com/science/article/abs/pii/S0165168409003648


