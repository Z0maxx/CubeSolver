#include "cross_sequences.cuh"

__constant__ EdgeSolveSequence const_crossSequences[24] =
{
	{
		Layer_Front,
		Cube_Bottom,
		Side_Front,
		{}
	},
	{
		Layer_Front,
		Cube_Bottom,
		Side_Bottom,
		{D, R, Dp, F}
	},
	{
		Layer_Middle,
		Cube_Bottom_Left,
		Side_Left,
		{L2, Up, F2}
	},
	{
		Layer_Middle,
		Cube_Bottom_Left,
		Side_Bottom,
		{Lp, Fp}
	},
	{
		Layer_Back,
		Cube_Bottom,
		Side_Back,
		{B2, U2, F2}
	},
	{
		Layer_Back,
		Cube_Bottom,
		Side_Bottom,
		{B, D, R, Dp}
	},
	{
		Layer_Middle,
		Cube_Bottom_Right,
		Side_Right,
		{R2, U, F2}
	},
	{
		Layer_Middle,
		Cube_Bottom_Right,
		Side_Bottom,
		{R, F}
	},

	{
		Layer_Front,
		Cube_Left,
		Side_Front,
		{Fp}
	},
	{
		Layer_Front,
		Cube_Left,
		Side_Left,
		{Dp, L, D}
	},
	{
		Layer_Back,
		Cube_Left,
		Side_Back,
		{L2, Fp, L2}
	},
	{
		Layer_Back,
		Cube_Left,
		Side_Left,
		{Dp, Lp, D}
	},
	{
		Layer_Front,
		Cube_Right,
		Side_Front,
		{F}
	},
	{
		Layer_Front,
		Cube_Right,
		Side_Right,
		{D, Rp, Dp}
	},
	{
		Layer_Back,
		Cube_Right,
		Side_Back,
		{R2, F, R2}
	},
	{
		Layer_Back,
		Cube_Right,
		Side_Right,
		{D, R, Dp}
	},

	{
		Layer_Front,
		Cube_Top,
		Side_Front,
		{F2}
	},
	{
		Layer_Front,
		Cube_Top,
		Side_Top,
		{F, D, Rp, Dp}
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		Side_Left,
		{Up, F2}
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		Side_Top,
		{L, Fp, Lp}
	},
	{
		Layer_Back,
		Cube_Top,
		Side_Back,
		{U2, F2}
	},
	{
		Layer_Back,
		Cube_Top,
		Side_Top,
		{U, Rp, F, R}
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		Side_Right,
		{U, F2}
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		Side_Top,
		{Rp, F, R}
	}
};