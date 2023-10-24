#pragma once

#include "variables.cuh"

extern __device__ void turnLayer(const int cubeIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice);
extern __device__ void turnCube(const int cubeIdx, const Direction direction, const bool twice);