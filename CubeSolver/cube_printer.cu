#include "cube_printer.cuh"

__host__ __device__ const char* getColor(const Color color)
{
    if (color == White)
    {
        return "\033[1;47m";
    }
    else if (color == Red)
    {
        return "\033[1;41m";
    }
    else if (color == Green)
    {
        return "\033[1;42m";
    }
    else if (color == Yellow)
    {
        return "\033[1;43m";
    }
    else if (color == Blue)
    {
        return "\033[1;44m";
    }
    else if (color == Orange)
    {
        return "\033[1;45m";
    }
    else
    {
        return "";
    }
}

__host__ __device__ const char* resetColor()
{
    return "\033[1;0m";
}

__host__ __device__ void printCube(const Color cube[3][9][6])
{
    for (int i = 2; i > -1; i--)
    {
        printf("      ");
        for (int j = 0; j < 3; j++)
        {
            printf("%s  %s", getColor(cube[i][j][Side_Top]), resetColor());
        }
        printf("\n");
    }

    for (int i = 2; i > -1; i--)
    {
        printf("%s  %s", getColor(cube[i][Cube_Top_Left][Side_Left]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[Layer_Front][i][Side_Front]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[i][Cube_Top_Right][Side_Right]), resetColor());
    }
    printf("\n");

    for (int i = 2; i > -1; i--)
    {
        printf("%s  %s", getColor(cube[i][Cube_Left][Side_Left]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[Layer_Front][i + 3][Side_Front]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[i][Cube_Right][Side_Right]), resetColor());
    }
    printf("\n");

    for (int i = 2; i > -1; i--)
    {
        printf("%s  %s", getColor(cube[i][Cube_Bottom_Left][Side_Left]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[Layer_Front][i + 6][Side_Front]), resetColor());
    }
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[i][Cube_Bottom_Right][Side_Right]), resetColor());
    }
    printf("\n");

    for (int i = 0; i < 3; i++)
    {
        printf("      ");
        for (int j = 6; j < 9; j++)
        {
            printf("%s  %s", getColor(cube[i][j][Side_Bottom]), resetColor());
        }
        printf("\n");
    }

    printf("      ");
    for (int i = 6; i < 9; i++)
    {
        printf("%s  %s", getColor(cube[2][i][Side_Back]), resetColor());
    }
    printf("\n");

    printf("      ");
    for (int i = 3; i < 6; i++)
    {
        printf("%s  %s", getColor(cube[2][i][Side_Back]), resetColor());
    }
    printf("\n");

    printf("      ");
    for (int i = 0; i < 3; i++)
    {
        printf("%s  %s", getColor(cube[2][i][Side_Back]), resetColor());
        
    }
    printf("\n");
    printf("\n");
}