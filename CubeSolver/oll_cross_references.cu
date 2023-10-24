#include "oll_cross_references.cuh"

__constant__ Reference const_OLLCrossReferences[4]
{
	{
		Layer_Front,
		Cube_Top,
		Side_Top
	},
	{
		Layer_Back,
		Cube_Top,
		Side_Top
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		Side_Top
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		Side_Top
	}
};

__constant__ Reference const_OLLCrossTargetReference =
{
	Layer_Middle,
	Cube_Top,
	Side_Top
};