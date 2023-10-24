#include "f2l_edge_sequence_finder.cuh"

__device__ const Notation* findF2LEdgeSequence(const uint2 edge, const Color colors[6], const Color targetColor)
{
	for (int i = 0; i < 16; i++)
	{
		if (const_F2LEdgeSequences[i].layer == edge.x && const_F2LEdgeSequences[i].cube == edge.y && colors[const_F2LEdgeSequences[i].side] == targetColor)
		{
			return const_F2LEdgeSequences[i].sequence;
		}
	}
	return { 0 };
}