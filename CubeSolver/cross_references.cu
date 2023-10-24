#include "cross_references.cuh"

__constant__ Reference const_crossReferences[2] =
{
	{
		Layer_Front,
		Cube_Center,
		Side_Front
	},
	{
		Layer_Middle,
		Cube_Bottom,
		Side_Bottom
	}
};

__constant__ Reference const_crossTargetReference =
{
	Layer_Front,
	Cube_Center,
	Side_Front
};