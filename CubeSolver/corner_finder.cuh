#pragma once

#include "variables.cuh"

extern __device__ const uint2 findCorner(const Color cubeColors[3][9][6], const Color colors[3], const int count);