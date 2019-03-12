#ifndef TRIANGLE_H
#define TRIANGLE_H

#include "shape.h"

/*'
 * The triangle class inherits from CShape.
 */
class CTriangle : public CShape {

public:

   /* Class constructor */
   CTriangle(float sides[3]);

   /* Class destructor */
   virtual ~CTriangle();

   /* Calculates the perimeter of the triangle */
   virtual float PerimeterCpp() const;

   /* Calculates the perimeter of the triangle */
   virtual float PerimeterAsm() const;

   /* Calculates the area of the triangle */
   virtual float AreaCpp() const;

   /* Calculates the area of the triangle */
   virtual float AreaAsm() const;

   /* Calculates the height of the triangle */
   float HeightCpp() const;

   /* Calculates the height of the triangle */
   float HeightAsm() const;

   /* Returns the name of the shape */
   virtual std::string Name() const;

private:

   /* The triangle sides */
   float mSides[3];
};

#endif
