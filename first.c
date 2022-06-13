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

int main(){
    srand(time(NULL));
    CAR cars[COUNT];
    for(int i=0; i < COUNT; i++){
        randomName(cars[i].model);
        cars[i].maxspeed = randint(100, 300);
        cars[i].price = randReal(1000.0, 100000.0);
    }
    printf("Enter number of cmp function:\n");
    int n;
    scanf("%d", &n);
    qsort(cars, COUNT, sizeof(cars[0]), getComparator(n));
    
    for(int i=0; i < COUNT; i++){
        printCAR(cars + i);
    }

    return 0;
}

int (*getComparator(int n))(const void *, const void *)
{
    switch (n)
    {
    case 1:
        return cmpModelASC;
        break;
    case 2:
        return cmpModelDSC;
        break;
    case 3:
        return cmpMaxspeedASC;
        break;
    case 4:
        return cmpMaxspeedDSC;
        break;
    case 5:
        return cmpPriceASC;
        break;
    case 6:
        return cmpPriceDSC;
        break;
    default:
        return NULL;
        break;
    }
}

int randint(int min, int max){
    return min + rand() % (max - min + 1);
}

double randReal(double min, double max){
    return min + ((double)rand() / RAND_MAX) * (max - min);
}


char* randomName(char* name){
    unsigned index = 0;
    name[index++] = randint('A', 'Z');
    int n = randint(4, 10);
    for (int i = 0; i < n; i++){
        name[index++] = randint('a', 'z');
    }

    name[index] = '\0';
    return name;
}

int cmpModelASC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    return strcmp(c1->model, c2->model);
}

int cmpModelDSC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    return strcmp(c2->model, c1->model);
}

int cmpMaxspeedASC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    return c1->maxspeed - c2->maxspeed;
}

int cmpMaxspeedDSC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    return c2->maxspeed - c1->maxspeed;
}

int cmpPriceASC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    if (fabs(c1->price - c2->price) < EPS){
        return 0;
    } else if (c1->price > c2->price){
        return 1;
    }
    return -1;

}

int cmpPriceDSC(const void *cp1, const void *cp2){
    CAR *c1 = (CAR*)cp1;
    CAR *c2 = (CAR*)cp2;
    if (fabs(c1->price - c2->price) < EPS){
        return 0;
    } else if (c1->price < c2->price){
        return 1;
    }
    return -1;

}

void printCAR(CAR *c){
    printf("Model is: %25s ", c->model);
    printf("Maximum speed is: %25u ", c->maxspeed);
    printf("Price is: %4.2lf\n", c->price);
}