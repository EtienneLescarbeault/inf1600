#include "triangle.h"
#include <cmath>

/****************************************/
/****************************************/

CTriangle::CTriangle(float sides[3]) {
   mSides[0] = sides[0];
   mSides[1] = sides[1];
   mSides[2] = sides[2];
}

/****************************************/
/****************************************/

CTriangle::~CTriangle() {
}

/****************************************/
/****************************************/

float CTriangle::PerimeterCpp() const {
   return mSides[0] + mSides[1] + mSides[2];
}

/****************************************/
/****************************************/

float CTriangle::AreaCpp() const {
   /* Heron's Formula for the area of a triangle */
   float p = PerimeterCpp() / 2.0f;
   return ::sqrt(p*(p-mSides[0])*(p-mSides[1])*(p-mSides[2]));
}

/****************************************/
/****************************************/

float CTriangle::HeightCpp() const {
	float A = AreaCpp();
	return 2.0f*A/mSides[2];
}

/****************************************/
/****************************************/

std::string CTriangle::Name() const {
   return "triangle";
}

/****************************************/
/****************************************/
