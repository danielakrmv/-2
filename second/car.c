#include "car.h"
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
    name[index++] = ' ';
    n = randint(4, 10);
    name[index++] = randint('A', 'Z');
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
    printf("Price is: %4lf ", c->price);
}