#include "cube_solver.cuh"
#include "cross_solver.cuh"
#include "f2l_corner_solver.cuh"
#include "f2l_edge_solver.cuh"
#include "oll_cross_solver.cuh"
#include "oll_edge_solver.cuh"
#include "pll_cycle_solver.cuh"
#include "pll_orient_solver.cuh"

#ifdef __INTELLISENSE__
#define CUDA_KERNEL(...)
#else
#define CUDA_KERNEL(...) <<< __VA_ARGS__ >>>
#endif

__device__ void printCubes()
{
	for (int i = 0; i < 6; i++)
	{
		printCube(dev_cubeColors[i]);
	}
}

__global__ void startSolveThread()
{
	turnCube(1, Direction_Up, false);
	dev_cubeRotationMoves[1] = x;
	turnCube(2, Direction_Down, false);
	dev_cubeRotationMoves[2] = xp;
	turnCube(3, Direction_Down, true);
	dev_cubeRotationMoves[3] = x2;
	turnCube(4, Direction_Tilt_Left, false);
	dev_cubeRotationMoves[4] = zp;
	turnCube(5, Direction_Tilt_Right, false);
	dev_cubeRotationMoves[5] = z;
}

void startSolve()
{
	startSolveThread CUDA_KERNEL(1, 1)();
	cudaDeviceSynchronize();
}

Color crossCubeColors[6][4][6][3][9][6];
Color edgeCubeColors[6][4][6][4][6][4][6][3][9][6];
Color cornerCubeColors[6][4][6][4][6][3][9][6];

void solve(const int cube[3][9][6])
{
	long long start = timeInMilliseconds();
	int cubes[6][3][9][6]{};
	for (int i = 0; i < 6; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			for (int k = 0; k < 9; k++)
			{
				for (int l = 0; l < 6; l++)
				{
					cubes[i][j][k][l] = cube[j][k][l];
				}
			}
		}
	}
	cudaDeviceSetCacheConfig(cudaFuncCachePreferShared);
	cudaMemcpyToSymbol(dev_cubeColors, cubes, sizeof(cubes));
	startSolve();
	solveCross();
	solveF2LCorner();
	cudaDeviceSetCacheConfig(cudaFuncCachePreferL1);
	solveF2LEdge();
	solveOLLCross();
	solveOLLEdge();
	solvePLLCycle();
	solvePLLOrient();
	long long end = timeInMilliseconds();
	printf("%d\n", end - start);
	/*cudaMemcpyFromSymbol(edgeCubeColors, dev_F2LEdgeCubeColors, sizeof(edgeCubeColors));
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 6; j++)
		{
			for (int k = 0; k < 4; k++)
			{
				for (int l = 0; l < 6; l++)
				{
					printCube(edgeCubeColors[3][1][1][i][j][k][l]);
				}
			}
		}
	}*/
}