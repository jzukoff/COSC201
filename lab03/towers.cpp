/* Towers of Hanoi
   Author:	Chris Nevison	1997/09/22
   Revised:	Tom Parks	2002/09/27
*/

#include <iostream>


void print(int from, int to)
{
    cout << "Move from peg " << from << " to peg " << to << endl; 
}


int towers(int numDiscs, int start, int goal) 
{ 
    int steps, peg; 

    if(numDiscs < 2)
    { 
	print(start, goal);
	return 1; 
    } 
    else
    { 
	peg = 6 - start - goal;		// Calculate intermediate peg.
	steps  = towers(numDiscs-1, start, peg); 
	steps += towers(1, start, goal); 
	steps += towers(numDiscs-1, peg, goal); 
	return steps; 
    } 
} 


int main() 
{ 
    int numDiscs, start, goal, steps; 

    cout << "Enter the number of disks to be moved: "; 
    cin >> numDiscs; 

    start = 1; 
    goal  = 3; 

    steps = towers(numDiscs, start, goal); 

    cout << endl << numDiscs << " discs moved from peg "
	 << start << " to peg " << goal << " in "
	 << steps << " steps." << endl; 

    return 0; 
} 
