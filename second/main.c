#include "car.h"

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

