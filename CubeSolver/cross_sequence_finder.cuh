#pragma once

#include "cross_sequences.cuh"

extern __device__ const Notation* findCrossSequence(const uint2 edge, const Color colors[6], const Color targetColor);