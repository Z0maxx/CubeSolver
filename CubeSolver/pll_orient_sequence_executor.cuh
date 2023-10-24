#pragma once

#include "notation_translator.cuh"
#include "f2l_edge_rotations.cuh"
#include "pll_orient_sequence.cuh"

extern __device__ void executePLLOrientSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const int idx, const int roundIdx);