---
title: Beacon Finding Tank | Projects | Sami Suteria
layout: default
---

# Beacon Finding Tank

Completed: December 2013

## Project Description

A blinking LED beacon (1 kHz) will be placed on 1 side of the field. The robot will start on the other side of the field, up to 20 feet away. The field is strewn with steel washers (land mines) that the robot must avoid. If you neutralize the mine by picking it up with a magnet without the mine otherwise touching your vehicle in any way, the mine is then rendered harmless. The objective is to traverse the minefield and reach the beacon without contacting a mine except with the neutralizer. Mines will be no closer than 18 inches apart.

## Final Paper

[Lab1 - Beacon Finding Tank - Final Paper](/static/Lab1-BeaconFindingTank-FinalPaper.pdf)

## Demo Video

<iframe src="//player.vimeo.com/video/106256309" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="http://vimeo.com/106256309">PROJECT DEMO</a> from <a href="http://vimeo.com/user5265979">Sami Suteria</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

## Abstract

This paper describes a system which autonomously tracks and moves toward a red 1 kHz LED beacon while avoiding/neutralizing steel washers on the ground. The overall system is a combination four separate sub systems. The first is a motor system, which is controlled by an L298, a dual-full bridge driver. The second system is the metal detection system, which is a combination of metal proximity sensors and an electromagnet attached to a servo. The third system is the LED detection system, which uses phototransistors and an op-amp based filter to isolate the 1 kHz signal. These three systems are controlled and coordinated by an FPGA, the Xilinx Spartan 3E, which was on the Diligent Basys2 development board.

## Project

A [Rover 5](https://www.sparkfun.com/products/10336) tank was used as the base for the rest of the electronics. There were three subsystems: motor control, mine detection and LED beacon detection. These three were all tied into the control system which ran on an FPGA.

### Motor Control System

The motors were standard DC motors and were powered by a Tenergy 7.2V RC Car Battery from [Frys](http://www.frys.com/product/6468002?site=sr:SEARCH:MAIN_RSLT_PG). Direction and control of the motors were done using an L298 Dual H-Bridge IC and the standard circuit from the datasheet was used. In order to control speed of the tank, a PWM was applied to the Enable Input of each motor on the H-Bridge. 

### Metal Detection

Metal Detectors were provided by the lab stock room. They were NPN Style detectors and the same 7.2V battery was used to power them. 

An electromagnet was also used in the metal detection system. When a mine was detected, the tank would back up and a servo with a wooden arm would swing around and the electomagnet would turn on and pick up the mine. It would then move the mine to the side of the tank. 

### LED Detection 

An NPN BJT photo diode was used to detect the beacon. The input signal from the beacon was amplified then filtered through a bandpass filter to isolate the 1kHz frequency. The LM348 quad op-amp IC was used since the design for the entire filter used four op-amps. This made the design very simple and only used one IC. 

### Control System

One major concern when working with motors and electromagnets with FPGAs is isolation. Everything other than the LED Detection was isolated from the FPGA using optoisolators. 

### Notes

All code and schematics can be seen in the final paper linked above. 









