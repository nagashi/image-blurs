# Description
# Given a black and white image, represented as the class you already implemented, implement a blur method to run a transformation on 
# the image. Running the blur transformation causes any 1 in the image to cause the pixel to the left, right, above and below to become a 1.

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0]
# ])
# image.output_image

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 1, 0],
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0]
# ])
# image.output_image

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [0, 0, 0, 0],
#   [1, 0, 0, 0],
#   [0, 0, 0, 0]
# ])
# image.output_image

# And when you run that code it will output the following to the terminal window respectively:

# 0000
# 0000
# 0100
# 1110
# 0100
# 0000

# 0010
# 0111
# 0110
# 1110
# 0100
# 0000

# 0000
# 0000
# 0000
# 1000
# 1100
# 1000

# Solution
class Image

  def initialize(array)
    @image = array
    blur_coords!
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  private

    def blur_coords!
      blur_coords = []
      @image.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          blur_coords << [i, row_i] if x == 1
        end
      end

      blur_coords.each do |coord|
        @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1
        @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0
        @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1
        @image[coord[0] - 1][coord[1]] = 1 if coord[0] - 1 >= 0
      end
    end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image.output_image
