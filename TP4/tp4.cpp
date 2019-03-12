#include <iostream>
#include <cmath>
#include <cstdlib>
#include <sstream>

#include "circle.h"
#include "triangle.h"

/****************************************/
/****************************************/

/*
 * Constant used to test float equality.
 */
static const float EPSILON = 1e-4;

/*
 * Returns true if the given values are close enough.
 * Not the best possible float comparison ever, but it's
 * enough for this TP.
 */
bool Equals(float a, float b) {
   /* Take care of obvious case */
   if(a == b) return true;
   /* Take care of approximations */
   if(::fabsf(a-b) < EPSILON) return true;
   /* If we get here, the numbers are most probably not equal */
   return false;
}

/****************************************/
/****************************************/

float StringToFloat(const char* str) {
   float f;
   std::istringstream iss(str);
   iss >> f;
   return f;
}

/****************************************/
/****************************************/

void TestShape(const CShape& s) {
   /* Calculate perimeter and area using C++ methods */
   float perimetercpp = s.PerimeterCpp();
   float areacpp = s.AreaCpp();
   /* Calculate perimeter and area using assembler methods */
   float perimeterasm = s.PerimeterAsm();
   float areaasm = s.AreaAsm();
   /* Print and test calculated values */
   std::cout << s.Name() << " perimeter:" << std::endl
             << "\tC++ -> " << perimetercpp << std::endl
             << "\tASM -> " << perimeterasm << std::endl;
   if(!Equals(perimetercpp, perimeterasm))
      std::cerr << "ERROR: the perimeters do not match" << std::endl;
   else
      std::cout << "\tThe perimeters match" << std::endl << std::endl;
   std::cout << s.Name() << " area:" << std::endl
             << "\tC++ -> " << areacpp << std::endl
             << "\tASM -> " << areaasm << std::endl;
   if(!Equals(areacpp, areaasm))
      std::cerr << "ERROR: the areas do not match" << std::endl;
   else
      std::cout << "\tThe areas match" << std::endl << std::endl;
}

/****************************************/
/****************************************/

void TestCircle(float radius) {
   CCircle c(radius);
   TestShape(c);
}

/****************************************/
/****************************************/

void TestTriangle(float sides[3]) {
   CTriangle t(sides);
   TestShape(t);
   /* Calculate height using C++ and assembler methods */
   float heightcpp = t.HeightCpp();
   float heightasm = t.HeightAsm();
   /* Print and test calculated values */
   std::cout << t.Name() << " height:" << std::endl
             << "\tC++ -> " << heightcpp << std::endl
             << "\tASM -> " << heightasm << std::endl;
   if(!Equals(heightcpp, heightasm))
      std::cerr << "ERROR: the heights do not match" << std::endl;
   else
      std::cout << "\tThe heights match" << std::endl << std::endl;
}

/****************************************/
/****************************************/

int main(int argc, char** argv) {
   /*
    * Command line argument parsing
    */
   /* Check that the right number of args was passed */
   if(argc != 5) {
      std::cerr << "Usage:" << std::endl;
      std::cerr << "\ttp4 <circle_radius> <triangle_side_1> <triangle_side_2> <triangle_side_3>" << std::endl;
      return 1;
   }
   /* Parse values */
   float radius = StringToFloat(argv[1]);
   float sides[] = {
      StringToFloat(argv[2]),
      StringToFloat(argv[3]),
      StringToFloat(argv[4])
   };
   /* Check that the triangle sides respect the triangle disequality */
   if((sides[0]+sides[1] <= sides[2]) ||
      (sides[0]+sides[2] <= sides[1]) ||
      (sides[1]+sides[2] <= sides[0])) {
      std::cerr << "ERROR: the triangle side lengths do not form a correct triangle." << std::endl;
      return 1;
   }
   /* Perform tests */
   TestCircle(radius);
   TestTriangle(sides);
   return 0;
}

