#include "variables.cuh"
#include "f2l_edge_rotations.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ Color dev_tempF2LEdgeColors[6][4][6][4][6][4][6][3][9][6];

__device__ void rotateF2LEdgeLayerColors(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const CubeLayer cubeLayer, const Direction direction)
{
    memcpy(dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], sizeof(dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y]));

    const int alwaysMoveIdx = cubeLayer / 3;
    const int directionIdx = direction % 2;

    for (int x = 0; x < 4; x++)
    {
        const Move cornerMove = const_layerCornerMoves[cubeLayer][directionIdx][x];

        for (int y = 0; y < 2; y++)
        {
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.targetLayer][cornerMove.targetCube][const_layerAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.originLayer][cornerMove.originCube][const_layerAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    for (int x = 0; x < 4; x++)
    {
        const Move edgeMove = const_layerEdgeMoves[cubeLayer][directionIdx][x];
        dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
        for (int y = 0; y < 2; y++)
        {
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.targetLayer][edgeMove.targetCube][const_layerAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.originLayer][edgeMove.originCube][const_layerAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    memcpy(dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], sizeof(dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y]));
}

__device__ void rotateF2LEdgeFaceColors(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const MoveIdx moveIdx)
{
    if (moveIdx == MoveIdx_None) return;

    const int alwaysMoveIdx = moveIdx / 2;

    for (int x = 0; x < 8; x++)
    {
        const Move cornerMove = const_faceCornerMoves[moveIdx][x];
        for (int y = 0; y < 2; y++)
        {
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.targetLayer][cornerMove.targetCube][const_faceAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][cornerMove.originLayer][cornerMove.originCube][const_faceAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    for (int x = 0; x < 12; x++)
    {
        const Move edgeMove = const_faceEdgeMoves[moveIdx][x];
        if (x < 8)
        {
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
        }
        else
        {
            for (int y = 0; y < 2; y++)
            {
                dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[y]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[y]];
            }
        }

        for (int i = 0; i < 2; i++)
        {
            dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.targetLayer][edgeMove.targetCube][const_faceAlwaysMoves[alwaysMoveIdx][i]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][edgeMove.originLayer][edgeMove.originCube][const_faceAlwaysMoves[alwaysMoveIdx][i]];
        }
    }

    for (int x = 0; x < 6; x++)
    {
        const Move centerMove = const_faceCenterMoves[moveIdx][x];
        dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][centerMove.targetLayer][centerMove.targetCube][centerMove.targetSides[0]] = dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][centerMove.originLayer][centerMove.originCube][centerMove.originSides[0]];
    }

    memcpy(dev_F2LEdgeCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y], sizeof(dev_tempF2LEdgeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y]));
}

__device__ void turnF2LEdgeLayer(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice) {
    rotateF2LEdgeLayerColors(cubeIdx, crossIdx, cornerIdx, edgeIdx, cubeLayer, direction);
    if (twice)
    {
        rotateF2LEdgeLayerColors(cubeIdx, crossIdx, cornerIdx, edgeIdx, cubeLayer, direction);
    }
}

__device__ void turnF2LEdgeCube(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Direction direction, const bool twice) {
    MoveIdx moveWithLayerIdx = const_cubeTurnMoveIdxs[direction];
    rotateF2LEdgeFaceColors(cubeIdx, crossIdx, cornerIdx, edgeIdx, moveWithLayerIdx);
    if (twice)
    {
        rotateF2LEdgeFaceColors(cubeIdx, crossIdx, cornerIdx, edgeIdx, moveWithLayerIdx);
    }
}