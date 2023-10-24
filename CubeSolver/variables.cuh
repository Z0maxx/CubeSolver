#pragma once

#include <string.h>

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "enums.h"
#include "structs.h"

extern __constant__ const Move const_layerCornerMoves[9][2][4];
extern __constant__ const Move const_layerEdgeMoves[9][2][4];

extern __constant__ const Move const_faceCornerMoves[6][8];
extern __constant__ const Move const_faceEdgeMoves[6][12];
extern __constant__ const Move const_faceCenterMoves[6][6];

extern __constant__ const Side const_layerAlwaysMoves[3][2];
extern __constant__ const CubeAlwaysMove const_layerCubeAlwaysMoves[9];
extern __constant__ const Side const_faceAlwaysMoves[3][2];

extern __constant__ const MoveIdx const_cubeTurnMoveIdxs[7];

extern __constant__ const SolvePiece solvePieces[4];
extern __constant__ const int solveOrders[4][6][4];

extern __device__ Color dev_cubeColors[6][3][9][6];
extern __device__ Color dev_crossCubeColors[6][4][6][3][9][6];
extern __device__ Color dev_F2LCornerCubeColors[6][4][6][4][6][3][9][6];
extern __device__ Color dev_F2LEdgeCubeColors[6][4][6][4][6][4][6][3][9][6];

extern __device__ Notation dev_cubeRotationMoves[6];
extern __device__ Notation dev_crossRotationMoves[6][4][6][4];
extern __device__ Notation dev_F2LCornerRotationMoves[6][4][6][4][6][4];
extern __device__ Notation dev_F2LEdgeRotationMoves[6][4][6][4][6][4][6][4];

extern __device__ Notation dev_crossLayerMoves[6][4][6][4][4];
extern __device__ Notation dev_F2LCornerLayerMoves[6][4][6][4][6][4][8];
extern __device__ Notation dev_F2LEdgeLayerMoves[6][4][6][4][6][4][6][4][16];
extern __device__ Notation dev_OLLCrossLayerMoves[6][4][6][4][6][4][6][3][6];
extern __device__ Notation dev_OLLEdgeLayerMoves[6][4][6][4][6][4][6][16];
extern __device__ Notation dev_PLLCycleLayerMoves[6][4][6][4][6][4][6][3][8];
extern __device__ Notation dev_PLLOrientLayerMoves[6][4][6][4][6][4][6][4][4][5];

extern __device__ Notation dev_sequence[263];
extern __device__ Notation dev_moves[82944][263];