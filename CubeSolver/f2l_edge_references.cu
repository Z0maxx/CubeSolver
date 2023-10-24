#include "f2l_corner_references.cuh"

__constant__ Reference const_F2LEdgeReferences[2] =
{
	{
		Layer_Middle,
		Cube_Left,
		Side_Left
	},
	{
		Layer_Front,
		Cube_Center,
		Side_Front
	}
};

__constant__ Reference const_F2LEdgeTargetReference =
{
	Layer_Front,
	Cube_Center,
	Side_Front,
};