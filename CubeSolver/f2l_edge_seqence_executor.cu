#include "f2l_edge_sequence_executor.cuh"

__device__ void executeF2LEdgeSequence(const int cubeIdx, const uint2 crossIdx, const uint2 cornerIdx, const uint2 edgeIdx, const Notation sequence[], const int idx)
{
	int i = 0;
	while (i < 16 && sequence[i] != None)
	{
		dev_F2LEdgeLayerMoves[cubeIdx][crossIdx.x][crossIdx.y][cornerIdx.x][cornerIdx.y][edgeIdx.x][edgeIdx.y][idx][i] = sequence[i];
		const TranslatedNotation move = translateNotation(sequence[i]);
		turnF2LEdgeLayer(cubeIdx, crossIdx, cornerIdx, edgeIdx, move.cubeLayer, move.direction, move.twice);
		i++;
	}
}