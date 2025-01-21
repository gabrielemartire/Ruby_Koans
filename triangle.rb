# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c) #NOTA v2
  x, y, z = [a,b,c].sort #NOTA pro tip
  raise TriangleError, "not a triangle" if a <= 0 || b <=0 || c<=0
  raise TriangleError, "not a triangle" if x+y <= z
  if a == b && a == c && b == c
    :equilateral
  elsif a != b && a != c && b != c
    :scalene
  else
    :isosceles
  end
end

def triangle_v2(a, b, c)  #NOTA v1
  if (a == 0 || b == 0 || c == 0)
    raise TriangleError, "side is zero"
  elsif (a<0 || b<0 || c<0)
    raise TriangleError, "some side is negative"
  elsif ( (a==b && a+b<=c) || (a==c && a+c<=b) || (c==b && b+c<=a))
    raise TriangleError, "sides senseless"
  elsif (a == b && b == c)
    return :equilateral
  elsif (a == b || a == c || b == c)
    return :isosceles
  else
    return :scalene
  end
end

class TriangleError < StandardError
end
