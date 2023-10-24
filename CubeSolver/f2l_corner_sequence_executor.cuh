#pragma once

#include "f2l_corner_rotations.cuh"
#include "notation_translator.cuh"

extern __device__ void executeF2LCornerSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const Notation sequence[], const int idx);