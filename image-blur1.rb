# Description
# Build a class that allows us to build a new image with the data we specify. Make it possible for the class to output the image to the screen. Your goal is to have the following code work:

# image = Image.new([
#   [0, 0, 0, 0],
#   [0, 1, 0, 0],
#   [0, 0, 0, 1],
#   [0, 0, 0, 0]
# ])
# image.output_image

# And when you run that code it will output the following to the terminal window:

# 0000
# 0100
# 0001
# 0000

# Solution
class Image
  attr_reader :image

  def initialize(image)
     @image = image
  end

  def output_image
    self.image.each do |row|
      puts row.join(" ") 
      puts ""
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image
