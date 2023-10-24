#pragma once

#include "variables.cuh"

extern __device__ void turnCrossCube(const int cubeIdx, const uint2 crossIdx, const Direction direction, const bool twice);
extern __device__ void turnCrossLayer(const int cubeIdx, const uint2 crossIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice);