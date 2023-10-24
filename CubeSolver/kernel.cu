#include "cube_solver.cuh"
#include "variables.cuh"
#include "sequence_processor.cuh"
#include "notation_translator.cuh"
#include "test_rotations.cuh"

int main()
{
    cudaSetDeviceFlags(cudaDeviceScheduleSpin);
    long long start = timeInMilliseconds();
    solve(testCubeColors);
    findSequence();
    Notation sequence[263]{};
    cudaMemcpyFromSymbol(sequence, dev_sequence, sizeof(sequence));
    long long end = timeInMilliseconds();
    printf("%d\n", end - start);
    for (int i = 0; i < 263; i++)
    {
        if (sequence[i] != None)
        {
            const TranslatedNotation move = translateNotation(sequence[i]);
            if (move.layer)
            {
                turnTestLayer(move.cubeLayer, move.direction, move.twice);
            }
            else
            {
                turnTestCube(move.direction, move.twice);
            }
            printf("%d ", sequence[i]);
        }
    }
    Color testColors[3][9][6]{};
    for (int i = 0; i < 3; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            for (int k = 0; k < 6; k++)
            {
                testColors[i][j][k] = (Color)testCubeColors[i][j][k];
            }
        }
    }
    printf("\n");
    printCube(testColors);
    scanf("%s");
}
