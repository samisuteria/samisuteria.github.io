---
title: Particle Photon - Getting Started
layout: post
---

So I backed the [Photon](https://store.particle.io/?product=particle-photon) on Kickstarter a while ago and finally had a chance to play with it.

When you first get the Photon you need to attach it to a wifi network and thats pretty straight forward with thier [iPhone App](https://itunes.apple.com/us/app/particle-build-photon-electron/id991459054?mt=8).

Particles [Web IDE](https://build.particle.io/) is pretty slick and you can send code straight from the browser to the device but I prefer something more local so I downloaded their installed their node CLI. The also have a local IDE called [Particle Dev](https://www.particle.io/dev) which you can use to write/verify/cloud compile your code then send the *.bin to the device. 

Node and dfu-util are required for this: 

```
brew install node
brew install dfu-util
```

```
npm install -g particle-cli
```

```
particle flash --usb firmware.bin
```

The code is still compiled on Particle's servers (boo) but at least now I can flash locally. 

