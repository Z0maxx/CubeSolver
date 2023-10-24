#include "variables.cuh"
#include "f2l_corner_rotations.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__shared__ Color shr_tempF2LCornerColors[4][6][3][9][6];

__device__ void rotateF2LCornerLayerColors(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const CubeLayer cubeLayer, const Direction direction)
{
    memcpy(shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y], dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y], sizeof(shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y]));

    const int alwaysMoveIdx = cubeLayer / 3;
    const int directionIdx = direction % 2;

    for (int x = 0; x < 4; x++)
    {
        const Move cornerMove = const_layerCornerMoves[cubeLayer][directionIdx][x];

        for (int y = 0; y < 2; y++)
        {
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][cornerMove.targetLayer][cornerMove.targetCube][const_layerAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][cornerMove.originLayer][cornerMove.originCube][const_layerAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    for (int x = 0; x < 4; x++)
    {
        const Move edgeMove = const_layerEdgeMoves[cubeLayer][directionIdx][x];
        shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
        for (int y = 0; y < 2; y++)
        {
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][edgeMove.targetLayer][edgeMove.targetCube][const_layerAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeMove.originLayer][edgeMove.originCube][const_layerAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    memcpy(dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y], shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y], sizeof(shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y]));
}

__device__ void rotateF2LCornerFaceColors(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const MoveIdx moveIdx)
{
    if (moveIdx == MoveIdx_None) return;

    const int alwaysMoveIdx = moveIdx / 2;

    for (int x = 0; x < 8; x++)
    {
        const Move cornerMove = const_faceCornerMoves[moveIdx][x];
        for (int y = 0; y < 2; y++)
        {
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][cornerMove.targetLayer][cornerMove.targetCube][const_faceAlwaysMoves[alwaysMoveIdx][y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][cornerMove.originLayer][cornerMove.originCube][const_faceAlwaysMoves[alwaysMoveIdx][y]];
        }
    }

    for (int x = 0; x < 12; x++)
    {
        const Move edgeMove = const_faceEdgeMoves[moveIdx][x];
        if (x < 8)
        {
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
        }
        else
        {
            for (int y = 0; y < 2; y++)
            {
                shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[y]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[y]];
            }
        }

        for (int i = 0; i < 2; i++)
        {
            shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][edgeMove.targetLayer][edgeMove.targetCube][const_faceAlwaysMoves[alwaysMoveIdx][i]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeMove.originLayer][edgeMove.originCube][const_faceAlwaysMoves[alwaysMoveIdx][i]];
        }
    }

    for (int x = 0; x < 6; x++)
    {
        const Move centerMove = const_faceCenterMoves[moveIdx][x];
        shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y][centerMove.targetLayer][centerMove.targetCube][centerMove.targetSides[0]] = dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][centerMove.originLayer][centerMove.originCube][centerMove.originSides[0]];
    }

    memcpy(dev_F2LCornerCubeColors[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y], shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y], sizeof(shr_tempF2LCornerColors[cornerIdx.x][cornerIdx.y]));
}

__device__ void turnF2LCornerLayer(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const CubeLayer cubeLayer, const Direction direction, const bool twice) {
    rotateF2LCornerLayerColors(cubeIdx, crossIdx, cornerIdx, cubeLayer, direction);
    if (twice)
    {
        rotateF2LCornerLayerColors(cubeIdx, crossIdx, cornerIdx, cubeLayer, direction);
    }
}

__device__ void turnF2LCornerCube(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const Direction direction, const bool twice) {
    MoveIdx moveIdx = const_cubeTurnMoveIdxs[direction];
    rotateF2LCornerFaceColors(cubeIdx, crossIdx, cornerIdx, moveIdx);
    if (twice)
    {
        rotateF2LCornerFaceColors(cubeIdx, crossIdx, cornerIdx, moveIdx);
    }
}