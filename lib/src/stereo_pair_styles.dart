import 'package:anaglyph/anaglyph.dart';
import 'package:flutter/material.dart';

// True Anaglyph
const trueAnaglyphLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const trueAnaglyphRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// Gray
const grayLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.299, 0.587, 0.113, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const grayRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// True Color
const trueColorLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      1, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const trueColorRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// Half Color
const halfColorLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0.299, 0.587, 0.114, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const halfColorRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// Optimized Color
const optimizedColorLeftChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0.7, 0.3, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);
const optimizedColorRightChannelStyle = AnaglyphStereoChannelStyle(
  colorFilter: ColorFilter.matrix(
    <double>[
      0, 0, 0, 0, 0, //
      0, 1, 0, 0, 0, //
      0, 0, 1, 0, 0, //
      0, 0, 0, 1, 0, //
    ],
  ),
);

// var matrices = {
//   'true': [
//     [0.299, 0.587, 0.114, 0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 0, 0, 0.299, 0.587, 0.114]
//   ],
//   'mono': [
//     [0.299, 0.587, 0.114, 0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0.299, 0.587, 0.114, 0.299, 0.587, 0.114]
//   ],
//   'color': [
//     [1, 0, 0, 0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 1, 0, 0, 0, 1]
//   ],
//   'halfcolor': [
//     [0.299, 0.587, 0.114, 0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 1, 0, 0, 0, 1]
//   ],
//   'optimized': [
//     [0, 0.7, 0.3, 0, 0, 0, 0, 0, 0],
//     [0, 0, 0, 0, 1, 0, 0, 0, 1]
//   ],
// };
