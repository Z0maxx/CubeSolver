#pragma once

#include "notation_translator.cuh"
#include "cross_rotations.cuh"

extern __device__ void executeCrossSequence(const int cubeIdx, const uint2 crossIdx, const Notation sequence[], const int idx);