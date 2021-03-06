#include <iostream>
#include <string>
#include <ctype.h>
using namespace std;


bool isPalindrome (string str){
	int i =0;
	int j = str.length()-1;

	while (i<j){
		while (i<j && isalnum(str[i])==0)
			i++;
		while (i<j && isalnum(str[j])==0)
			j--;

		if (tolower(str[i]) != tolower(str[j])){
			return false;
		}
		else{
			i++;
			j--;
		}

	}
	return true;
}


int main (){
	string str = " ";
	while (! str.empty()){
	cout <<"Enter word to check if palindrome: ";
	cin >> str;
	int ans = isPalindrome(str);

	if(ans==1)
		cout<< str << " is a Palindrome\n\n";
	else
		cout<< str <<" is not a Palindrome\n\n";
	}
}