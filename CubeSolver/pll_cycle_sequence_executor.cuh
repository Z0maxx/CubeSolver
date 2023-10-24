#pragma once

#include "notation_translator.cuh"
#include "f2l_edge_rotations.cuh"

extern __device__ void executePLLCycleSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Notation sequence[], const int idx);