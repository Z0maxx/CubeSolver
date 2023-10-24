#pragma once

#include "enums.h"

extern int testCubeColors[3][9][6];
extern void turnTestCube(Direction direction, const bool twice);
extern void turnTestLayer(CubeLayer layer, const Direction direction, const bool twice);