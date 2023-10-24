#include "oll_edge_sequence_executor.cuh"

__device__ void executeOLLEdgeSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Notation sequence[])
{
	int i = 0;
	while (i < 15 && sequence[i] != None)
	{
		dev_OLLEdgeLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][i + 1] = sequence[i];
		const TranslatedNotation move = translateNotation(sequence[i]);
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, move.cubeLayer, move.direction, move.twice);
		i++;
	}
}