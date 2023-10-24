#include "edge_finder.cuh"

__constant__ const Edge const_edges[12] =
{
	{
		Layer_Front,
		Cube_Top,
		{ Side_Top, Side_Front }
	},
	{
		Layer_Front,
		Cube_Left,
		{ Side_Left, Side_Front }
	},
	{
		Layer_Front,
		Cube_Right,
		{ Side_Right, Side_Front }
	},
	{
		Layer_Middle,
		Cube_Top_Left,
		{ Side_Left, Side_Top }
	},
	{
		Layer_Middle,
		Cube_Top_Right,
		{ Side_Right, Side_Top }
	},
	{
		Layer_Back,
		Cube_Top,
		{ Side_Top, Side_Back }
	},
	{
		Layer_Back,
		Cube_Left,
		{ Side_Left, Side_Back }
	},
	{
		Layer_Back,
		Cube_Right,
		{ Side_Right, Side_Back}
	},
	{
		Layer_Front,
		Cube_Bottom,
		{ Side_Bottom, Side_Front}
	},
	{
		Layer_Middle,
		Cube_Bottom_Left,
		{ Side_Left, Side_Bottom}
	},
	{
		Layer_Middle,
		Cube_Bottom_Right,
		{ Side_Right, Side_Bottom}
	},
	{
		Layer_Back,
		Cube_Bottom,
		{ Side_Bottom, Side_Back}
	},
};

__device__ const uint2 findEdge(const Color cubeColors[3][9][6], const Color colors[2], const int count)
{
	for (int i = 0; i < count; i++)
	{
		const Layer layer = const_edges[i].layer;
		const Cube cube = const_edges[i].cube;
		Color targetColors[2]{};
		for (int j = 0; j < 2; j++)
		{
			targetColors[j] = cubeColors[layer][cube][const_edges[i].sides[j]];
		}
		if (targetColors[0] == colors[0] && targetColors[1] == colors[1] || targetColors[0] == colors[1] && targetColors[1] == colors[0])
		{
			return make_uint2(layer, cube);
		}
	}
	return make_uint2(100, 100);
}