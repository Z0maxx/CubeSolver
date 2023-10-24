#include "error_printer.cuh"

void printError(cudaError_t error)
{
	printf("%s %s\n", cudaGetErrorName(error), cudaGetErrorString(error));
}