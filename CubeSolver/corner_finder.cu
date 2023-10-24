#include "corner_finder.cuh"

__constant__ const Corner const_corners[8] =
{
	{
		Layer_Front,
		Cube_Top_Left,
		{ Side_Left, Side_Front, Side_Top }
	},
	{
		Layer_Front,
		Cube_Top_Right,
		{ Side_Right, Side_Front, Side_Top }
	},
	{
		Layer_Back,
		Cube_Top_Left,
		{ Side_Left, Side_Back, Side_Top }
	},
	{
		Layer_Back,
		Cube_Top_Right,
		{ Side_Right, Side_Back, Side_Top }
	},
	{
		Layer_Front,
		Cube_Bottom_Left,
		{ Side_Left, Side_Front, Side_Bottom }
	},
	{
		Layer_Front,
		Cube_Bottom_Right,
		{ Side_Right, Side_Front, Side_Bottom }
	},
	{
		Layer_Back,
		Cube_Bottom_Left,
		{ Side_Left, Side_Back, Side_Bottom }
	},
	{
		Layer_Back,
		Cube_Bottom_Right,
		{ Side_Right, Side_Back, Side_Bottom }
	}
};

__device__ const uint2 findCorner(const Color cubeColors[3][9][6], const Color colors[3], const int count)
{
	for (int i = 0; i < count; i++)
	{
		const Layer layer = const_corners[i].layer;
		const Cube cube = const_corners[i].cube;
		Color targetColors[3]{};
		for (int j = 0; j < 3; j++)
		{
			targetColors[j] = cubeColors[layer][cube][const_corners[i].sides[j]];
		}
		if (targetColors[0] == colors[0] && targetColors[1] == colors[1] && targetColors[2] == colors[2] ||
			targetColors[0] == colors[0] && targetColors[1] == colors[2] && targetColors[2] == colors[1] ||
			targetColors[0] == colors[1] && targetColors[1] == colors[0] && targetColors[2] == colors[2] ||
			targetColors[0] == colors[1] && targetColors[1] == colors[2] && targetColors[2] == colors[0] ||
			targetColors[0] == colors[2] && targetColors[1] == colors[0] && targetColors[2] == colors[1] ||
			targetColors[0] == colors[2] && targetColors[1] == colors[1] && targetColors[2] == colors[0])
		{
			return make_uint2(layer, cube);
		}
	}
	return make_uint2(100, 100);
}