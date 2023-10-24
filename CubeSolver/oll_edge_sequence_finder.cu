#include "oll_edge_sequence_finder.cuh"

__device__ Notation* findOLLEdgeSequence(const bool match[4], const bool near[4])
{
	for (int i = 0; i < 15; i++)
	{
		int j = 0;
		while (j < 4 && const_OLLEdgeSequences[i].match[j] == match[j] && (i < 8 && const_OLLEdgeSequences[i].near[j] == near[j] || i >= 8))
		{
			j++;
		}
		if (j == 4)
		{
			return const_OLLEdgeSequences[i].sequence;
		}
	}

	return { 0 };
}