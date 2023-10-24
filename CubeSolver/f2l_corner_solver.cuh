#pragma once

#include <string.h>

#include "corner_finder.cuh"
#include "corner_sequence_finder.cuh"
#include "f2l_corner_rotations.cuh"
#include "f2l_corner_references.cuh"
#include "f2l_corner_sequences.cuh"
#include "f2l_corner_sequence_executor.cuh"
#include "solve_rotation_finder.cuh"

extern void solveF2LCorner();