#pragma once

#include "f2l_edge_sequences.cuh"

extern __device__ const Notation* findF2LEdgeSequence(const uint2 edge, const Color colors[6], const Color targetColor);