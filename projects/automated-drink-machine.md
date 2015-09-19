---
title: Automated Drink Machine | Projects | Sami Suteria
layout: default
---

# Automated Drink Machine

Completed: May 2014

## Project Description

Design and construct a microprocessor controlled robot that will retrieve a container, dispense prescribed amounts of three different liquids into the container and deliver the product to the user. All movement of the robot shall be encoded and measured.

## Final Paper

[Lab 2 - Automated Drink Machine - Final Paper](/static/Lab2-AutomatedDrinkMachine-FinalPaper.pdf)

[Lab 2 - Poster Slides](/static/Lab2-PosterSlides.pdf)

## Demo Video

<iframe width="420" height="315" src="//www.youtube.com/embed/f7Bruf27ZKU" frameborder="0" allowfullscreen></iframe>

## Abstract

This paper describes an automated liquid dispensing system. The system can dispense a prescribed and measured amount of liquid. The system has applications in manufacturing and food service where precise amounts of liquids are needed. The system also uses a three-axis arm to place and retrieve a container that the liquid is dispensed into. The system is controlled by a Texas Instruments MSP430 microcontroller and the user interface served by a Raspberry Pi computer. Liquid flow through the system is measured by flow meters and controlled by solenoid valves. Results and observations were measured and recorded with water as the liquid moving through the system. 

## Project

This project involved a lot of different moving parts. It had a 3 axis servo controlled arm which was 3D-printed, solenoid values and liquid containers, a microcontroller (MSP430 Launchpad) which was controlling all of the above and a Raspberry Pi running a web server which was serving up the user interface and interfacing with the microcontroller via UART. 

### Dispensing System

The dispensing system was gravity fed and consisted of a liquid container, a flow meter, a pump, solenoid valve, and the cup it was pouring into. Because the system was not pressurized, there was not pressure from gravity to allow enough flow past the flow meter for it to spin and give a reading. Adding the pump helped us measure the flow more accurately. 

### Three-Axis Arm

This arm is a modified version of an arm we found on [Thingiverse](http://www.thingiverse.com/thing:30163). Our code for the arm had some problems with the feedback loop we were using to confirm the location of the arm. The servos on the arm had a 4th wire that was connected to the internal potentiometer. These [analog feedback servos](http://www.adafruit.com/product/1404) were both helpful but we did not excute correctly on this project.

### Code

Other than leaks with the dispensing system and the arm not moving correctly, the rest of the code worked perfectly on the MSP430 and on the Raspberry Pi. 

