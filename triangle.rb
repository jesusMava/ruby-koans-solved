def triangle(a, b, c)
  raise TriangleError if a <= 0 || b <= 0 || c <= 0

  return :equilateral if EquilateralTriangle.new.equilateral(a, b, c)

  return :isosceles if IsoscelesTriangle.new.isosceles(a, b, c)

  return :scalene if ScaleneTriangle.new.scalene
end

class EquilateralTriangle
  def equilateral(a, b, c)
    if a == b
      :equilateral if b == c
    end
  end
end

class IsoscelesTriangle
  def isosceles(a, b, c)
    if a == b || a == c || b == c 
      raise TriangleError if invalid_sides(a, b, c)

      :isosceles
    end
  end
  
  def invalid_sides(a, b, c)
    return true if a == b && a + b <= c
    return true if a == c && a + c <= b
    return true if b == c && b + c <= a
  end
end

class ScaleneTriangle
  def scalene
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
