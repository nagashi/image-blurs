# Description
# Given an image, we want to build a method to blur the image. However, instead of only blurring images that are within 1 pixel, we want to 
# specify how far to blur pixels that are within a Manhattan Distance of what is specified. In the previous challenge we built a method that 
# will produce the blurring with a Manhattan distance of 1. Build the method def blur(distance) that will implement a blurring of the 
# Manhattan distance specified.

# In short: you want to find all 1's and turn any pixels that can be reached by making n moves or less using only left, right, up or down from 
# the starting point.

# image = Image.new([
#     [0, 0, 0, 0],
#     [0, 0, 0, 0],
#     [0, 0, 0, 0],
#     [0, 1, 0, 0],
#     [0, 0, 0, 0],
#     [0, 0, 0, 0]
#   ])
#   image.blur(1)
#   image.output_image
  
#   image = Image.new([
#     [0, 0, 0, 0],
#     [0, 0, 0, 0],
#     [0, 0, 0, 0],
#     [0, 1, 0, 0],
#     [0, 0, 0, 0],
#     [0, 0, 0, 0]
#   ])
#   image.blur(2)
#   image.output_image
  
#   image = Image.new([
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 1, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 1]
#   ])
#   image.blur(3)
#   image.output_image

# And when you run that code it will output the following to the terminal window respectively:

# 0 0 0 0
# 0 0 0 0
# 0 1 0 0
# 1 1 1 0
# 0 1 0 0
# 0 0 0 0

# 0 0 0 0
# 0 1 0 0
# 1 1 1 0
# 1 1 1 1
# 1 1 1 0
# 0 1 0 0

# 0 0 0 0 0 0 0 0 0
# 0 0 0 1 0 0 0 0 0
# 0 0 1 1 1 0 0 0 0
# 0 1 1 1 1 1 0 0 0
# 1 1 1 1 1 1 1 0 0
# 0 1 1 1 1 1 0 0 0
# 0 0 1 1 1 0 0 0 0
# 0 0 0 1 0 0 0 0 0
# 0 0 0 0 0 0 0 0 1
# 0 0 0 0 0 0 0 1 1
# 0 0 0 0 0 0 1 1 1
# 0 0 0 0 0 1 1 1 1

# Solution
class Image

  def initialize(array)
    @image = array
  end

  def blur(distance)
      @distance = distance

      if ! @distance.between?(1, 3)
          puts "Valid numbers are between 1 and 3"
          return
      end

      @distance.times do
          blur_coords!
      end
  end

  def output_image
      puts ""
      case @distance
      when 1
          puts "Manhattan distance of 1"
      when 2
          puts "Manhattan distance of 2"
      when 3
          puts "Manhattan distance of 3"
      end
    @image.each do |row|
      puts ("  " + row.join(" ") )
    end
    puts ""
  end

  private
  

    def blur_coords!
      blur_coords = []
      @image.each_with_index do |row, i|
        row.each_with_index do |x, row_i|
          blur_coords << [i, row_i] if x == 1
        end
      end

      blur_coords.each do |coord|0

          @image[coord[0]][coord[1] + 1] = 1 if coord[1] + 1 <= @image[coord[0]].length - 1   # columns
          @image[coord[0]][coord[1] - 1] = 1 if coord[1] - 1 >= 0                             
          @image[coord[0] + 1][coord[1]] = 1 if coord[0] + 1 <= @image.length - 1             # rows
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
image.blur(1)
image.output_image

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur(2)
image.output_image

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])
image.blur(3)
image.output_image