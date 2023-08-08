![anaglyph package header](https://user-images.githubusercontent.com/61120718/212234454-8b3105ba-66bc-4bc3-a539-1907417a1cf4.png)
[Nebula image credits: NASA, ESA, CSA, and STScI](https://www.nasa.gov/image-feature/goddard/2022/nasa-s-webb-reveals-cosmic-cliffs-glittering-landscape-of-star-birth)

# Anaglyph Package

Unlock the power of 3D with the Anaglyph package, and create stunning applications that will leave your users in awe!

Experience seamless compatibility across all platforms, as the Anaglyph package effortlessly works its magic on any type of color display.

With this powerful package, you can effortlessly transform ordinary 2D widgets into immersive 3D experiences that can be enjoyed with anaglyph glasses. And the best part? You don't even have to buy anaglyph glasses - you can make your own in no time!

-------

## What is anaglyph?

> Anaglyph 3D is the stereoscopic 3D effect achieved by means of encoding each eye's image using filters of different (usually chromatically opposite) colors, typically red and cyan. Anaglyph 3D images contain two differently filtered colored images, one for each eye. When viewed through the "color-coded" "anaglyph glasses", each of the two images reaches the eye it's intended for, revealing an integrated stereoscopic image. The visual cortex of the brain fuses this into the perception of a three-dimensional scene or composition.
> 
> [**\- Wikipedia**](https://en.wikipedia.org/wiki/Anaglyph_3D)

In other words, the anaglyph method is an easy and inexpensive way to create a 3D experience. This is a perfect option for those looking for an easy and inexpensive way to create 3D images.


## Features

- Turn almost any widget into a stunning 3D anaglyph version easily.   

- Adjust the 3D depth to customize the visual experience.

- Smoothly apply changes with built-in animations.

## Quick Start Guide

- Use `AnaglyphView` to create a 3D appearance.  

- Use `AnaglyphStyle` to set a default anaglyph style for subtrees.  

- Use `AnimatedAnaglyphStyle` to apply anaglyph style changes with a custom animation.  

## Basic Usage

```dart
AnaglyphView(
    depth: -7,
    child: Image.network(
        'https://www.nasa.gov/sites/default/files/thumbnails/image/pillars_of_creation.jpg',
    ),
),
```

<img src="https://raw.githubusercontent.com/amir-msh/anaglyph/main/screenshots/nebula-readme-example-min.png" alt="Flutter logo output" height="370" width="auto">

### Special Scenarios

#### Transparent Background

If you want to wrap the widgets that have a transparent background (e.g. Text, Icon, FlutterLogo) in `AnaglyphView`, make sure that `clipOuters` is false:

```dart
AnaglyphView(
    depth: -4,
    clipOuters: false,
    child: FlutterLogo(size: 250),
),
```

<img src="https://raw.githubusercontent.com/amir-msh/anaglyph/main/screenshots/flutter-logo-readme-example-min.png" alt="Flutter logo output" height="370" width="auto">

## Donation

If you like this package, I'd appreciate your generous donations!😃  

<a href="https://www.buymeacoffee.com/amirmsh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="box-shadow: 0px 1px 9px brown;" height="auto" width="210"></a>