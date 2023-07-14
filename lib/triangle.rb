require "pry"
class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    valid_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def valid_triangle
    valid_triangle_size
    valid_triangle_length_sum
  end

  def valid_triangle_size
    if side1 <= 0 || side2 <= 0 || side3 <= 0
      raise TriangleError, "Side lengths must be larger than 0."
    end
  end

  def valid_triangle_length_sum
    if (side1 + side2 <= side3) || (side2 + side3 <= side1) || (side3 + side1 <= side2)
      raise TriangleError, "Invalid triangle. The sum of any two sides must be greater than the third side."
    end
  end

  class TriangleError < StandardError
  end

end