#include "pll_cycle_sequence_executor.cuh"

__device__ void executePLLCycleSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Notation sequence[], const int idx)
{
	for (int i = 0; i < 8; i++)
	{
		dev_PLLCycleLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][idx][i] = sequence[i];
		const TranslatedNotation move = translateNotation(sequence[i]);
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, move.cubeLayer, move.direction, move.twice);
	}
}