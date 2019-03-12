#ifndef CIRCLE_H
#define CIRCLE_H

#include "shape.h"

/*
 * The circle class inherits from CShape.
 */
class CCircle : public CShape {

public:

   /* Class constructor */
   CCircle(float radius);

   /* Class destructor */
   virtual ~CCircle();

   /* Calculates the perimeter of the circle */
   virtual float PerimeterCpp() const;

   /* Calculates the perimeter of the circle */
   virtual float PerimeterAsm() const;

   /* Calculates the area of the circle */
   virtual float AreaCpp() const;

   /* Calculates the area of the circle */
   virtual float AreaAsm() const;

   /* Returns the name of the shape */
   virtual std::string Name() const;

private:

   /* The circle radius */
   float mRadius;
};

#endif
