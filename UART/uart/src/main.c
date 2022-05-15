#include <stdio.h>
#include <string.h>
#include "xil_printf.h"
#include <ctype.h>

void isPalindrome(char str[]){

	int check = 0;
	int length = strlen(str) -1;
	char a = 'a';
	char z = 'z';

	for(int i = 0; i <= length; i++){//convert all characters to lower
	  str[i] = tolower(str[i]);
	}
	  while (length > check){
		  if (!(str[check] > a && str[check] < z))
			  check++;
		  else if (!(str[length] > a && str[length] < z))
			  length--;

		  else if (str[check] == str[length])
			  check++, length--;

		  else
			  printf("is not a palindrome");
			  return;

	  }


	  printf ("is a palindrome");
	}




int main ()
{
	char inp[100];

	printf("Please enter a sentence or word to check if it is a palindrome: \n\n");
	scanf("%s", inp);
	isPalindrome(inp);


}
