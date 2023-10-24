#include "variables.cuh"
#include "cross_rotations.cuh"

const Move layerCornerMoves[9][2][4] =
{
	{
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
			},
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			},
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			}
		},
		{
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Back,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Back,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			}
		},
		{
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Left, Side_Top},
				Layer_Back,
				Cube_Top_Right,
				{Side_Top, Side_Right}
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Top, Side_Right},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left},
				Layer_Back,
				Cube_Top_Left,
				{Side_Left, Side_Top}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Bottom},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Top, Side_Front},
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Front, Side_Bottom},
				Layer_Front,
				Cube_Top_Left,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Back},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Top},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Top, Side_Front},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Top},
				Layer_Front,
				Cube_Top_Left,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Back},
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Top},
			},
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Front, Side_Bottom},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Bottom, Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Top, Side_Front},
				Layer_Back,
				Cube_Top,
				{Side_Back, Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Front, Side_Bottom},
				Layer_Front,
				Cube_Top,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom, Side_Back},
				Layer_Front,
				Cube_Bottom,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top,
				{Side_Back, Side_Top},
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Top, Side_Front},
				Layer_Front,
				Cube_Bottom,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top,
				{Side_Back, Side_Top},
				Layer_Front,
				Cube_Top,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom, Side_Back},
				Layer_Back,
				Cube_Top,
				{Side_Back, Side_Top},
			},
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Front, Side_Bottom},
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom, Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Front},
				Layer_Back,
				Cube_Top_Right,
				{Side_Back, Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Bottom},
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Bottom, Side_Back},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Back, Side_Top},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Bottom, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Front},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Back, Side_Top},
				Layer_Front,
				Cube_Top_Right,
				{Side_Top, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Bottom, Side_Back},
				Layer_Back,
				Cube_Top_Right,
				{Side_Back, Side_Top},
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Bottom},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Bottom, Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Front},
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Front, Side_Right},
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Right, Side_Back},
				Layer_Front,
				Cube_Top_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Left},
				Layer_Back,
				Cube_Top_Right,
				{Side_Right, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Front},
				Layer_Front,
				Cube_Top_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Left},
				Layer_Front,
				Cube_Top_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Top_Right,
				{Side_Right, Side_Back},
				Layer_Back,
				Cube_Top_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Top_Right,
				{Side_Front, Side_Right},
				Layer_Back,
				Cube_Top_Right,
				{Side_Right, Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Left,
				{Side_Left, Side_Front},
				Layer_Back,
				Cube_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Right,
				{Side_Front, Side_Right},
				Layer_Front,
				Cube_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Right, Side_Back},
				Layer_Front,
				Cube_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Back, Side_Left},
				Layer_Back,
				Cube_Right,
				{Side_Right, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Left,
				{Side_Left, Side_Front},
				Layer_Front,
				Cube_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Back, Side_Left},
				Layer_Front,
				Cube_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Right, Side_Back},
				Layer_Back,
				Cube_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Right,
				{Side_Front, Side_Right},
				Layer_Back,
				Cube_Right,
				{Side_Right, Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Left, Side_Front},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Right},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Back},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Back, Side_Left},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Left, Side_Front},
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Right}
			},
			{
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Back, Side_Left},
				Layer_Front,
				Cube_Bottom_Left,
				{Side_Left, Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Back},
				Layer_Back,
				Cube_Bottom_Left,
				{Side_Back, Side_Left}
			},
			{
				Layer_Front,
				Cube_Bottom_Right,
				{Side_Front, Side_Right},
				Layer_Back,
				Cube_Bottom_Right,
				{Side_Right, Side_Back}
			}
		}
	},
};

const Move layerEdgeMoves[9][2][4] =
{
	{
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Top},
				Layer_Front,
				Cube_Left,
				{Side_Left}
			},
			{
				Layer_Front,
				Cube_Left,
				{Side_Left},
				Layer_Front,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Front,
				Cube_Right,
				{Side_Right},
				Layer_Front,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Front,
				Cube_Right,
				{Side_Right}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Top},
				Layer_Front,
				Cube_Right,
				{Side_Right}
			},
			{
				Layer_Front,
				Cube_Left,
				{Side_Left},
				Layer_Front,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Front,
				Cube_Right,
				{Side_Right},
				Layer_Front,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Front,
				Cube_Left,
				{Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Middle,
				Cube_Top,
				{Side_Top},
				Layer_Middle,
				Cube_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Left,
				{Side_Left},
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Right,
				{Side_Right},
				Layer_Middle,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Middle,
				Cube_Right,
				{Side_Right}
			}
		},
		{
			{
				Layer_Middle,
				Cube_Top,
				{Side_Top},
				Layer_Middle,
				Cube_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Left,
				{Side_Left},
				Layer_Middle,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Right,
				{Side_Right},
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Middle,
				Cube_Left,
				{Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Back,
				Cube_Top,
				{Side_Top},
				Layer_Back,
				Cube_Left,
				{Side_Left}
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Left},
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Right},
				Layer_Back,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Back,
				Cube_Right,
				{Side_Right}
			}
		},
		{
			{
				Layer_Back,
				Cube_Top,
				{Side_Top},
				Layer_Back,
				Cube_Right,
				{Side_Right}
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Left},
				Layer_Back,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Right},
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Back,
				Cube_Left,
				{Side_Left}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Left,
				{Side_Front},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom},
				Layer_Front,
				Cube_Left,
				{Side_Front},
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Back},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Top},
				Layer_Back,
				Cube_Left,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Left,
				{Side_Front},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Top},
				Layer_Front,
				Cube_Left,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Left,
				{Side_Back},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Bottom},
				Layer_Back,
				Cube_Left,
				{Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Center,
				{Side_Front},
				Layer_Middle,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Front,
				Cube_Center,
				{Side_Front},
			},
			{
				Layer_Back,
				Cube_Center,
				{Side_Back},
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top,
				{Side_Top},
				Layer_Back,
				Cube_Center,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Center,
				{Side_Front},
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top,
				{Side_Top},
				Layer_Front,
				Cube_Center,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Center,
				{Side_Back},
				Layer_Middle,
				Cube_Top,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom,
				{Side_Bottom},
				Layer_Back,
				Cube_Center,
				{Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Right,
				{Side_Front},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Bottom},
				Layer_Front,
				Cube_Right,
				{Side_Front},
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Back},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top},
				Layer_Back,
				Cube_Right,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Right,
				{Side_Front},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Bottom}
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top},
				Layer_Front,
				Cube_Right,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Right,
				{Side_Back},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Top}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Bottom},
				Layer_Back,
				Cube_Right,
				{Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Front},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Right},
				Layer_Front,
				Cube_Top,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Top,
				{Side_Back},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left},
				Layer_Back,
				Cube_Top,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Top,
				{Side_Front},
				Layer_Middle,
				Cube_Top_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left},
				Layer_Front,
				Cube_Top,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Top,
				{Side_Back},
				Layer_Middle,
				Cube_Top_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Top_Right,
				{Side_Right},
				Layer_Back,
				Cube_Top,
				{Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Center,
				{Side_Front},
				Layer_Middle,
				Cube_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Right,
				{Side_Right},
				Layer_Front,
				Cube_Center,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Center,
				{Side_Back},
				Layer_Middle,
				Cube_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Left,
				{Side_Left},
				Layer_Back,
				Cube_Center,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Center,
				{Side_Front},
				Layer_Middle,
				Cube_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Left,
				{Side_Left},
				Layer_Front,
				Cube_Center,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Center,
				{Side_Back},
				Layer_Middle,
				Cube_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Right,
				{Side_Right},
				Layer_Back,
				Cube_Center,
				{Side_Back}
			}
		}
	},
	{
		{
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Front},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right},
				Layer_Front,
				Cube_Bottom,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Back},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Left},
				Layer_Back,
				Cube_Bottom,
				{Side_Back}
			}
		},
		{
			{
				Layer_Front,
				Cube_Bottom,
				{Side_Front},
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right}
			},
			{
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Left},
				Layer_Front,
				Cube_Bottom,
				{Side_Front}
			},
			{
				Layer_Back,
				Cube_Bottom,
				{Side_Back},
				Layer_Middle,
				Cube_Bottom_Left,
				{Side_Left}
			},
			{
				Layer_Middle,
				Cube_Bottom_Right,
				{Side_Right},
				Layer_Back,
				Cube_Bottom,
				{Side_Back}
			}
		}
	}
};

const Move faceCornerMoves[6][8] =
{
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Left},
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Back}
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Right},
			Layer_Front,
			Cube_Top_Left,
			{Side_Left, Side_Front}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Front, Side_Left},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Left, Side_Back}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Front, Side_Right},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Left, Side_Front}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Back},
			Layer_Back,
			Cube_Top_Right,
			{Side_Back, Side_Right}
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Right, Side_Back},
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Right}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Left, Side_Back},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Back, Side_Right}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Back},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Front, Side_Right}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Left},
			Layer_Front,
			Cube_Top_Right,
			{Side_Right, Side_Front}
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Right},
			Layer_Back,
			Cube_Top_Right,
			{Side_Right, Side_Back}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Front, Side_Left},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Right, Side_Front}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Front, Side_Right},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Back}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Back},
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Left}
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Right, Side_Back},
			Layer_Back,
			Cube_Top_Left,
			{Side_Back, Side_Left}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Left, Side_Back},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Front, Side_Left}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Back},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Back, Side_Left}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Top},
			Layer_Back,
			Cube_Top_Left,
			{Side_Top, Side_Back}
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Top},
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Back}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Front, Side_Bottom},
			Layer_Front,
			Cube_Top_Left,
			{Side_Top, Side_Front}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Front, Side_Bottom},
			Layer_Front,
			Cube_Top_Right,
			{Side_Top, Side_Front}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Top, Side_Back},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Back, Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Back},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Back, Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Back, Side_Bottom},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Front}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Back, Side_Bottom},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Bottom, Side_Front}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Top},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Front}
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Top},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Bottom, Side_Front}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Front, Side_Bottom},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Back}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Front, Side_Bottom},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Bottom, Side_Back}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Top, Side_Back},
			Layer_Front,
			Cube_Top_Left,
			{Side_Front, Side_Top}
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Back},
			Layer_Front,
			Cube_Top_Right,
			{Side_Front, Side_Top}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Back, Side_Bottom},
			Layer_Back,
			Cube_Top_Left,
			{Side_Top, Side_Back}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Back, Side_Bottom},
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Back}
		}
			},
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Front,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Front,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Front,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		},
		{
			Layer_Front,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Front,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Front,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Front,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left}
		},
		{
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		},
		{
			Layer_Back,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Back,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Back,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Back,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left}
		}
	}
};

const Move faceEdgeMoves[6][12] =
{
	{
		{
			Layer_Front,
			Cube_Top,
			{Side_Front},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Front},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left},
			Layer_Back,
			Cube_Top,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Right},
			Layer_Front,
			Cube_Top,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Left},
			Layer_Back,
			Cube_Bottom,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right},
			Layer_Front,
			Cube_Bottom,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Back},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Right}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Back},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right}
		},
		{
			Layer_Front,
			Cube_Left,
			{Side_Left, Side_Front},
			Layer_Back,
			Cube_Left,
			{Side_Back, Side_Left}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Front, Side_Right},
			Layer_Front,
			Cube_Left,
			{Side_Left, Side_Front}
		},

		{
			Layer_Back,
			Cube_Left,
			{Side_Left, Side_Back},
			Layer_Back,
			Cube_Right,
			{Side_Back, Side_Right}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Right, Side_Back},
			Layer_Front,
			Cube_Right,
			{Side_Front, Side_Right}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top,
			{Side_Front},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Right}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Front},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left},
			Layer_Front,
			Cube_Top,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Right},
			Layer_Back,
			Cube_Top,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Left},
			Layer_Front,
			Cube_Bottom,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right},
			Layer_Back,
			Cube_Bottom,
			{Side_Back}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Back},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Back},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Left}
		},
		{
			Layer_Front,
			Cube_Left,
			{Side_Left, Side_Front},
			Layer_Front,
			Cube_Right,
			{Side_Front, Side_Right}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Front, Side_Right},
			Layer_Back,
			Cube_Right,
			{Side_Right, Side_Back}
		},
		{
			Layer_Back,
			Cube_Left,
			{Side_Left, Side_Back},
			Layer_Front,
			Cube_Left,
			{Side_Front, Side_Left}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Right, Side_Back},
			Layer_Back,
			Cube_Left,
			{Side_Back, Side_Left}
		}
	},
	{
		{
			Layer_Front,
			Cube_Left,
			{Side_Front},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Top}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Front},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Top},
			Layer_Back,
			Cube_Left,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top},
			Layer_Back,
			Cube_Right,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom},
			Layer_Front,
			Cube_Left,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Bottom},
			Layer_Front,
			Cube_Right,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Left,
			{Side_Back},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Back},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Top,
			{Side_Front, Side_Top},
			Layer_Back,
			Cube_Top,
			{Side_Top, Side_Back}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Front, Side_Bottom},
			Layer_Front,
			Cube_Top,
			{Side_Top, Side_Front}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Top, Side_Back},
			Layer_Back,
			Cube_Bottom,
			{Side_Back, Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Back, Side_Bottom},
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom, Side_Front}
		}
	},
	{
		{
			Layer_Front,
			Cube_Left,
			{Side_Front},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Front},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Top},
			Layer_Front,
			Cube_Left,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top},
			Layer_Front,
			Cube_Right,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom},
			Layer_Back,
			Cube_Left,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Bottom},
			Layer_Back,
			Cube_Right,
			{Side_Back}
		},
		{
			Layer_Back,
			Cube_Left,
			{Side_Back},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Top}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Back},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top}
		},
		{
			Layer_Front,
			Cube_Top,
			{Side_Front, Side_Top},
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom, Side_Front}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Front, Side_Bottom},
			Layer_Back,
			Cube_Bottom,
			{Side_Bottom, Side_Back}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Top, Side_Back},
			Layer_Front,
			Cube_Top,
			{Side_Front, Side_Top}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Back, Side_Bottom},
			Layer_Back,
			Cube_Top,
			{Side_Top, Side_Back}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top,
			{Side_Top},
			Layer_Front,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Front,
			Cube_Left,
			{Side_Left},
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Right},
			Layer_Front,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Front,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Top},
			Layer_Back,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Back,
			Cube_Left,
			{Side_Left},
			Layer_Back,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Right},
			Layer_Back,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Back,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		}
	},
	{
		{
			Layer_Front,
			Cube_Top,
			{Side_Top},
			Layer_Front,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Front,
			Cube_Left,
			{Side_Left},
			Layer_Front,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Front,
			Cube_Right,
			{Side_Right},
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Front,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Front,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Back,
			Cube_Top,
			{Side_Top},
			Layer_Back,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Back,
			Cube_Left,
			{Side_Left},
			Layer_Back,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Back,
			Cube_Right,
			{Side_Right},
			Layer_Back,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Back,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Back,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left, Side_Top},
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top, Side_Right}
		},
		{
			Layer_Middle,
			Cube_Top_Right,
			{Side_Top, Side_Right},
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left},
			Layer_Middle,
			Cube_Top_Left,
			{Side_Left, Side_Top}
		},
		{
			Layer_Middle,
			Cube_Bottom_Right,
			{Side_Right, Side_Bottom},
			Layer_Middle,
			Cube_Bottom_Left,
			{Side_Bottom, Side_Left}
		}
	}
};

const Move faceCenterMoves[6][6] =
{
	{
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		}
	},
	{
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		}
		,
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		}
	},
	{
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		},
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		}
	},
	{
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		}
				},
	{
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		}
	},
	{
		{
			Layer_Middle,
			Cube_Top,
			{Side_Top},
			Layer_Middle,
			Cube_Right,
			{Side_Right}
		},
		{
			Layer_Middle,
			Cube_Left,
			{Side_Left},
			Layer_Middle,
			Cube_Top,
			{Side_Top}
		},
		{
			Layer_Middle,
			Cube_Right,
			{Side_Right},
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom}
		},
		{
			Layer_Middle,
			Cube_Bottom,
			{Side_Bottom},
			Layer_Middle,
			Cube_Left,
			{Side_Left}
		},
		{
			Layer_Front,
			Cube_Center,
			{Side_Front},
			Layer_Front,
			Cube_Center,
			{Side_Front}
		},
		{
			Layer_Back,
			Cube_Center,
			{Side_Back},
			Layer_Back,
			Cube_Center,
			{Side_Back}
		}
	}
};

const Side layerAlwaysMoves[3][2] =
{
	{ Side_Front, Side_Back },
	{ Side_Left, Side_Right },
	{ Side_Top, Side_Bottom }
};

const CubeAlwaysMove layerCubeAlwaysMoves[9] =
{
	{ Layer_Front, Cube_Center },
	{ Layer_Middle, Cube_Center },
	{ Layer_Back, Cube_Center },
	{ Layer_Middle, Cube_Left },
	{ Layer_Middle, Cube_Center },
	{ Layer_Middle, Cube_Right },
	{ Layer_Middle, Cube_Top },
	{ Layer_Middle, Cube_Center },
	{ Layer_Middle, Cube_Bottom }
};

const Side faceAlwaysMoves[3][2] =
{
	{ Side_Top, Side_Bottom },
	{ Side_Left, Side_Right },
	{ Side_Front, Side_Back }
};

const MoveIdx cubeTurnMoveIdxs[7] =
{
	MoveIdx_Y_Right,
	MoveIdx_Y_Left,
	MoveIdx_X_Down,
	MoveIdx_X_Up,
	MoveIdx_Z_Right,
	MoveIdx_Z_Left,
	MoveIdx_None
};

int tempTestCubeColors[3][9][6];
int testCubeColors[3][9][6] =
{
	{
		{
			0,
			2,
			5,
			0,
			3,
			0
		},
		{
			0,
			0,
			3,
			0,
			1,
			0
		},
		{
			6,
			0,
			3,
			0,
			1,
			0
		},
		{
			0,
			1,
			0,
			0,
			6,
			0
		},
		{
			0,
			0,
			0,
			0,
			5,
			0
		},
		{
			5,
			0,
			0,
			0,
			6,
			0
		},
		{
			0,
			6,
			0,
			4,
			5,
			0
		},
		{
			0,
			0,
			0,
			4,
			6,
			0
		},
		{
			4,
			0,
			0,
			5,
			2,
			0
		}
	},
	{
		{
			0,
			3,
			6,
			0,
			0,
			0
		},
		{
			0,
			0,
			3,
			0,
			0,
			0
		},
		{
			3,
			0,
			5,
			0,
			0,
			0
		},
		{
			0,
			6,
			0,
			0,
			0,
			0
		},
		{
			0,
			0,
			0,
			0,
			0,
			0
		},
		{
			2,
			0,
			0,
			0,
			0,
			0
		},
		{
			0,
			1,
			0,
			4,
			0,
			0
		},
		{
			0,
			0,
			0,
			4,
			0,
			0
		},
		{
			2,
			0,
			0,
			1,
			0,
			0
		}
	},
	{
		{
			0,
			4,
			1,
			0,
			0,
			2
		},
		{
			0,
			0,
			2,
			0,
			0,
			5
		},
		{
			3,
			0,
			1,
			0,
			0,
			2
		},
		{
			0,
			4,
			0,
			0,
			0,
			2
		},
		{
			0,
			0,
			0,
			0,
			0,
			1
		},
		{
			3,
			0,
			0,
			0,
			0,
			2
		},
		{
			0,
			6,
			0,
			4,
			0,
			1
		},
		{
			0,
			0,
			0,
			5,
			0,
			4
		},
		{
			5,
			0,
			0,
			3,
			0,
			6
		}
	}
};

void rotateTestLayerColors(const CubeLayer cubeLayer, const Direction direction)
{
	memcpy(tempTestCubeColors, testCubeColors, sizeof(testCubeColors));

	const int alwaysMoveIdx = cubeLayer / 3;
	const int directionIdx = direction % 2;

	for (int x = 0; x < 4; x++)
	{
		const Move cornerMove = layerCornerMoves[cubeLayer][directionIdx][x];

		for (int y = 0; y < 2; y++)
		{
			tempTestCubeColors[cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = testCubeColors[cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
			tempTestCubeColors[cornerMove.targetLayer][cornerMove.targetCube][layerAlwaysMoves[alwaysMoveIdx][y]] = testCubeColors[cornerMove.originLayer][cornerMove.originCube][layerAlwaysMoves[alwaysMoveIdx][y]];
		}
	}

	for (int x = 0; x < 4; x++)
	{
		const Move edgeMove = layerEdgeMoves[cubeLayer][directionIdx][x];
		tempTestCubeColors[edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = testCubeColors[edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
		for (int y = 0; y < 2; y++)
		{
			tempTestCubeColors[edgeMove.targetLayer][edgeMove.targetCube][layerAlwaysMoves[alwaysMoveIdx][y]] = testCubeColors[edgeMove.originLayer][edgeMove.originCube][layerAlwaysMoves[alwaysMoveIdx][y]];
		}
	}

	memcpy(testCubeColors, tempTestCubeColors, sizeof(tempTestCubeColors));
}

void rotateTestFaceColors(MoveIdx moveIdx)
{
	if (moveIdx == MoveIdx_None) return;

	const int alwaysMoveIdx = moveIdx / 2;

	for (int x = 0; x < 8; x++)
	{
		const Move cornerMove = faceCornerMoves[moveIdx][x];
		for (int y = 0; y < 2; y++)
		{
			tempTestCubeColors[cornerMove.targetLayer][cornerMove.targetCube][cornerMove.targetSides[y]] = testCubeColors[cornerMove.originLayer][cornerMove.originCube][cornerMove.originSides[y]];
			tempTestCubeColors[cornerMove.targetLayer][cornerMove.targetCube][faceAlwaysMoves[alwaysMoveIdx][y]] = testCubeColors[cornerMove.originLayer][cornerMove.originCube][faceAlwaysMoves[alwaysMoveIdx][y]];
		}
	}

	for (int x = 0; x < 12; x++)
	{
		const Move edgeMove = faceEdgeMoves[moveIdx][x];
		if (x < 8)
		{
			tempTestCubeColors[edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[0]] = testCubeColors[edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[0]];
		}
		else
		{
			for (int y = 0; y < 2; y++)
			{
				tempTestCubeColors[edgeMove.targetLayer][edgeMove.targetCube][edgeMove.targetSides[y]] = testCubeColors[edgeMove.originLayer][edgeMove.originCube][edgeMove.originSides[y]];
			}
		}

		for (int i = 0; i < 2; i++)
		{
			tempTestCubeColors[edgeMove.targetLayer][edgeMove.targetCube][faceAlwaysMoves[alwaysMoveIdx][i]] = testCubeColors[edgeMove.originLayer][edgeMove.originCube][faceAlwaysMoves[alwaysMoveIdx][i]];
		}
	}

	for (int x = 0; x < 6; x++)
	{
		const Move centerMove = faceCenterMoves[moveIdx][x];
		tempTestCubeColors[centerMove.targetLayer][centerMove.targetCube][centerMove.targetSides[0]] = testCubeColors[centerMove.originLayer][centerMove.originCube][centerMove.originSides[0]];
	}

    memcpy(testCubeColors, tempTestCubeColors, sizeof(tempTestCubeColors));
}

void turnTestLayer(CubeLayer cubeLayer, const Direction direction, const bool twice) {
	rotateTestLayerColors(cubeLayer, direction);
	if (twice)
	{
		rotateTestLayerColors(cubeLayer, direction);
	}
}

void turnTestCube(Direction direction, const bool twice) {
	MoveIdx moveIdx = cubeTurnMoveIdxs[direction];
	rotateTestFaceColors(moveIdx);
	if (twice)
	{
		rotateTestFaceColors(moveIdx);
	}
}