#pragma once

#include "variables.cuh"

extern __device__ void turnF2LCornerCube(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const Direction direction, const bool twice);
extern __device__ void turnF2LCornerLayer(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice);