#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char* argv[]) {
  if (argc > 1) {
    ofstream myfile;
    myfile.open("stats.log", ios::app);
    myfile << "time\tkevin\t" << argv[1] << "\n";
    myfile.close();
    return 0;
  }
}
