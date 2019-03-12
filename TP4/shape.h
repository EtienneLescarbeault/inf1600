#ifndef SHAPE_H
#define SHAPE_H

#include <string>

/*
 * Base class for shapes.
 */
class CShape {

public:

   /* Class destructor */
   virtual ~CShape() {}

   /* Calculates the perimeter of the shape */
   virtual float PerimeterCpp() const = 0;

   /* Calculates the perimeter of the shape */
   virtual float PerimeterAsm() const = 0;

   /* Calculates the area of the surface */
   virtual float AreaCpp() const = 0;

   /* Calculates the area of the surface */
   virtual float AreaAsm() const = 0;

   /* Returns the name of the shape */
   virtual std::string Name() const = 0;
};

#endif
