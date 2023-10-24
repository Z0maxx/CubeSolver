#pragma once

#include "variables.cuh"

extern __device__ void turnF2LEdgeCube(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Direction direction, const bool twice);
extern __device__ void turnF2LEdgeLayer(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice);