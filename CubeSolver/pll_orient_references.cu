#include "pll_orient_references.cuh"

__constant__ Reference const_PLLOrientReference =
{
	Layer_Middle,
	Cube_Top,
	Side_Top
};

__constant__ Reference const_PLLOrientTargetReferences[4] =
{
	{
		Layer_Front,
		Cube_Top_Left,
		Side_Top
	},
	{
		Layer_Back,
		Cube_Top_Left,
		Side_Top
	},
	{
		Layer_Back,
		Cube_Top_Right,
		Side_Top
	},
	{
		Layer_Front,
		Cube_Top_Right,
		Side_Top
	}
};

__constant__ Reference const_PLLOrientCurrentTargetReference =
{
	Layer_Front,
	Cube_Top_Left,
	Side_Top
};

__constant__ Reference const_PLLOrientFinalReferences[2] =
{
	{
		Layer_Front,
		Cube_Top,
		Side_Front
	},
	{
		Layer_Front,
		Cube_Center,
		Side_Front
	}
};