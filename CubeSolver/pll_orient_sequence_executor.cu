#include "pll_orient_sequence_executor.cuh"

__device__ void executePLLOrientSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const int idx, const int roundIdx)
{
	for (int i = 0; i < 4; i++)
	{
		dev_PLLOrientLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][idx][roundIdx][i] = const_PLLOrientSequence[i];
		const TranslatedNotation move = translateNotation(const_PLLOrientSequence[i]);
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, move.cubeLayer, move.direction, move.twice);
	}
}