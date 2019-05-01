class Image
  attr_reader :image

  def initialize(image)
     @image = image
  end

  def pixel(pixel=0)
    @pixel = pixel

    @rows    = ( (@image.length) - 1)
    @columns = ( (@image[0].length) - 1)

    @msg = []

    puts "" # Create a space from where the pixel was entered.

    # Interrogate parameters entered
    if ! @image.kind_of?(Array) 
      puts "Please begin with a valid array."
      return
    end

    @chk = 0
    for n in 0..@rows
      if @image[n].length != @columns
        @cnt = 1
      end
    end

    if @chk == 1
      puts "All columns must be the same # of elements in the array."
      return
    end

    @coord = []
    @cnt = 0

    # check for coordinates
    until @cnt > @rows
        if @image[@cnt].include? 1
            @image[@cnt].each_with_index do |i, ndx|

               if i == 1
                 @coord << [@cnt, ndx]
               end
            end
        end
      @cnt += 1
    end

    # return if there are no coordinates
    if @coord.empty?
      puts "Please insure array has valid value(s) '1' for this exercise."
      return
    end

    @ndx = 0
    @coord.each do |row, column|
      @ndx = [row, column]

      case 

        # upper left corner
        when ( (@pixel == 1) && (@ndx[0] == 0) && (@ndx[1] == 0) )
          @image[@ndx[0]][@ndx[1] + 1] = 1  # one column to the right.
          @image[@ndx[0] + 1][@ndx[1]] = 1  # one row down same column.
          
        when ( (@pixel == 2) && (@ndx[0] == 0) && (@ndx[1] == 0) )
          @image[@ndx[0]][@ndx[1] + 1] = 1  # one column to the right
          @image[@ndx[0]][@ndx[1] + 2] = 1  # two columns to the right
          @image[@ndx[0] + 1][@ndx[1]] = 1  # one row down same column
          @image[@ndx[0] + 2][@ndx[1]] = 1  # tow rows down same column 

        # left edge
        when ( (@pixel == 1) && (@ndx[0].between?(1, (@rows -1))) && (@ndx[1] == 0) )
          @image[@ndx[0] - 1][@ndx[1]] = 1 # one row up same column
          @image[@ndx[0]][@ndx[1] + 1] = 1 # one column to the right
          @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down same column

        when ( (@pixel == 2) && (@ndx[0].between?(2, (@rows - 2))) && (@ndx[1] == 0) )
          @image[@ndx[0] - 2][@ndx[1]] = 1 # 2 rows up same column
          @image[@ndx[0] - 1][@ndx[1]] = 1 # 1 rows up same column
          @image[@ndx[0]][@ndx[1] + 2] = 1 # 2 columns over same row
          @image[@ndx[0]][@ndx[1] + 1] = 1 # 1 column over same row
          @image[@ndx[0] + 2][@ndx[1]] = 1 # 2 rows down same column
          @image[@ndx[0] + 1][@ndx[1]] = 1 # 1 row down same column

        # lower left corner
        when ( (@pixel == 1) && (@ndx[0] == @rows) && (@ndx[1] == 0) )
          @image[@ndx[0] - 1][@ndx[1]] = 1  # one row up same column
          @image[@ndx[0]][@ndx[1] + 1] = 1  # one column to the right
          
        when ( (@pixel == 2) && (@ndx[0] == @rows) && (@ndx[1] == 0) )
          @image[@ndx[0] - 1][@ndx[1]] = 1  # one row up same column
          @image[@ndx[0] - 2][@ndx[1]] = 1  # two rows up same column
          @image[@ndx[0]][@ndx[1] + 1] = 1  # one column to the right
          @image[@ndx[0]][@ndx[1] + 2] = 1  # two columns to the right

        # bottom row
        when ( (@pixel == 1) && (@ndx[0] == @rows) && (@ndx[1].between?(1, (@columns - 1))) )
          @image[@ndx[0]][@ndx[1] - 1] = 1 # same row to the left
          @image[@ndx[0]][@ndx[1] + 1] = 1 # same row to the right
          @image[@ndx[0] - 1][@ndx[1]] = 1 # one row up same column

        when ( (@pixel == 2) && (@ndx[0] == @rows) && (@ndx[1].between?(2, (@columns - 2))) )
          @image[@ndx[0]][@ndx[1] - 2] = 1 # two columns to the left
          @image[@ndx[0]][@ndx[1] - 1] = 1 # one column to the left
          @image[@ndx[0]][@ndx[1] + 2] = 1 # two rows to the right
          @image[@ndx[0]][@ndx[1] + 1] = 1 # one row to the right
          @image[@ndx[0] - 1][@ndx[1]] = 1 # one row above
          @image[@ndx[0] - 2][@ndx[1]] = 1 # two rows above

        # lower right
        when ( (@pixel == 1) && (@ndx[0] == @rows) && (@ndx[1] == @columns) )
          @image[@ndx[0] - 1][@ndx[1]] = 1  # 1 row up same column
          @image[@ndx[0]][@ndx[1] -1] = 1  # same row one column to the left
          
        when ( (@pixel == 2) && (@ndx[0] == @rows) && (@ndx[1] == @columns) )
          @image[@ndx[0] - 1][@ndx[1]] = 1  # up a row same column
          @image[@ndx[0] - 2][@ndx[1]] = 1  # up 2 rows same column
          @image[@ndx[0]][@ndx[1] -1] = 1  # same row, 1 columns to the left
          @image[@ndx[0]][@ndx[1] -2] = 1  # same row, 2 columns to the left

        # right edge
        when ( (@pixel == 1) && (@ndx[0].between?(1, (@rows -1))) && (@ndx[1] == @columns) )
          @image[@ndx[0] - 1][@ndx[1]] = 1 # one row up same column
          @image[@ndx[0]][@ndx[1] - 1] = 1 # one column to the left
          @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down same column

        when ( (@pixel == 2) && (@ndx[0].between?(2, (@rows - 2))) && (@ndx[1] == @columns) )
          @image[@ndx[0] - 2][@ndx[1]] = 1 # 2 rows up same column
          @image[@ndx[0] - 1][@ndx[1]] = 1 # 1 rows up same column
          @image[@ndx[0]][@ndx[1] - 2] = 1 # 2 columns left same row
          @image[@ndx[0]][@ndx[1] - 1] = 1 # 1 column left same row
          @image[@ndx[0] + 2][@ndx[1]] = 1 # 2 rows down same column
          @image[@ndx[0] + 1][@ndx[1]] = 1 # 1 row down same column

        # upper right
        when ( (@pixel == 1) && (@ndx[0] == 0) && (@ndx[1] == @columns) )
          @image[@ndx[0] + 1][@ndx[1]] = 1  # 1 row down same column
          @image[@ndx[0]][@ndx[1] -1] = 1  # same row one column to the left
          
        when ( (@pixel == 2) && (@ndx[0] == 0) && (@ndx[1] == @columns) )
          @image[@ndx[0] + 1][@ndx[1]] = 1  # down a row same column
          @image[@ndx[0] + 2][@ndx[1]] = 1  # down 2 rows same column
          @image[@ndx[0]][@ndx[1] -1] = 1  # same row, 1 columns to the left
          @image[@ndx[0]][@ndx[1] -2] = 1  # same row, 2 columns to the left

        # top row
        when ( (@pixel == 1) && (@ndx[0] == 0) && (@ndx[1].between?(1, (@columns - 1))) )
          @image[@ndx[0]][@ndx[1] - 1] = 1 # same row to the left
          @image[@ndx[0]][@ndx[1] + 1] = 1 # same row to the right
          @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down same column

        when ( (@pixel == 2) && (@ndx[0] == 0) && (@ndx[1].between?(2, (@columns - 2))) )
          @image[@ndx[0]][@ndx[1] - 2] = 1 # two columns to the left
          @image[@ndx[0]][@ndx[1] - 1] = 1 # one column to the left
          @image[@ndx[0]][@ndx[1] + 2] = 1 # two columns to the right
          @image[@ndx[0]][@ndx[1] + 1] = 1 # one column to the right
          @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down
          @image[@ndx[0] + 2][@ndx[1]] = 1 # two rows down

        else
          if @pixel == 1
            @image[@ndx[0]][@ndx[1] - 1] = 1 # same row one column to the left
            @image[@ndx[0]][@ndx[1] + 1] = 1 # same row one column to the right
            @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down same column
            @image[@ndx[0] - 1][@ndx[1]] = 1 # one row up same column

          elsif @pixel == 2
                  
            if ( ((@ndx[1] - 2) >= 0) && ((@ndx[1] + 2) <= @columns) && ((@ndx[0] +2) <= @rows) && ((@ndx[0] -2) >= 0) )
            
              @image[@ndx[0]][@ndx[1] - 2] = 1 # two columns to the left
              @image[@ndx[0]][@ndx[1] - 1] = 1 # one column to the left
              @image[@ndx[0]][@ndx[1] + 2] = 1 # two columns to the right
              @image[@ndx[0]][@ndx[1] + 1] = 1 # one column to the right
              @image[@ndx[0] + 1][@ndx[1]] = 1 # one row down
              @image[@ndx[0] + 2][@ndx[1]] = 1 # two rows down
              @image[@ndx[0] - 1][@ndx[1]] = 1 # one row up
              @image[@ndx[0] - 2][@ndx[1]] = 1 # two rows up
                         
            end 
          end # if statement
      end # case statement
    end   # each do
  end # pixel method

  def output_image
    self.image.each do |row|
      puts row.join(" ") 
      puts ""
    end
    if ! @msg.empty?
      puts @msg
    end
  end
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
puts "Enter 1 for the pixel count 
      or 0 just to view the array 
      without any modification."
reply = gets.chomp
image.pixel(reply.to_i)
image.output_image

