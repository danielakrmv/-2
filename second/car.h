#include <stdio.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <stdint.h>

#define COUNT 10
#define EPS 0.001

typedef struct
{
    char model[21];
    uint8_t maxspeed;
    double price;
} CAR;

int (*getComparator(int))(const void *, const void *);

int randint(int,int);
double randReal(double,double);
char* randomName(char*);

int cmpModelASC(const void *, const void *);
int cmpModelDSC(const void *, const void *);
int cmpMaxspeedASC(const void *, const void *);
int cmpMaxspeedDSC(const void *, const void *);
int cmpPriceASC(const void *, const void *);
int cmpPriceDSC(const void *, const void *);

void printCAR(CAR*);