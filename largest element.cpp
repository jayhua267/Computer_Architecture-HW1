#include <iostream>
using namespace std;

int main()
{
    int i, flag=0, size = 10;
    int arr[size] = {9,28,63,88,52,9,75,6,26,7};


    // Loop to store largest number to arr[0]
    for(i = 0;i < size; i++)
    {
       // Change < to > if you want to find the smallest element
       if(flag < arr[i])
           flag = arr[i] ;
    }
    cout << "The largest number in array of " << size << " is "<< flag;

    return 0;
}
