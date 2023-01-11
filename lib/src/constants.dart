import 'package:flutter/rendering.dart';

const double kDefaultDepth = -3;

// true anaglyphs
const leftChannelTrueAnaglyphColorFilter = ColorFilter.matrix(
  <double>[
    0.299, 0.587, 0.114, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

const rightChannelTrueAnaglyphColorFilter = ColorFilter.matrix(
  <double>[
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0.299, 0.587, 0.114, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

// gray
const leftChannelGrayColorFilter = ColorFilter.matrix(
  <double>[
    0.299, 0.587, 0.113, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

const rightChannelGrayColorFilter = ColorFilter.matrix(
  <double>[
    0, 0, 0, 0, 0, //
    0.299, 0.587, 0.114, 0, 0, //
    0.299, 0.587, 0.114, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

// true color
const leftChannelTrueColorFilter = ColorFilter.matrix(
  <double>[
    1, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

const rightChannelTrueColorFilter = ColorFilter.matrix(
  <double>[
    0, 0, 0, 0, 0, //
    0, 1, 0, 0, 0, //
    0, 0, 1, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

// half color
const leftChannelHalfColorFilter = ColorFilter.matrix(
  <double>[
    0.299, 0.587, 0.114, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

const rightChannelHalfColorFilter = ColorFilter.matrix(
  <double>[
    0, 0, 0, 0, 0, //
    0, 1, 0, 0, 0, //
    0, 0, 1, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

// optimized color
const leftChannelOptimizedColorFilter = ColorFilter.matrix(
  <double>[
    0, 0.7, 0.3, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
);

const rightChannelOptimizedColorFilter = ColorFilter.matrix(
  <double>[
    0, 0, 0, 0, 0, //
    0, 1, 0, 0, 0, //
    0, 0, 1, 0, 0, //
    0, 0, 0, 1, 0, //
  ],
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
