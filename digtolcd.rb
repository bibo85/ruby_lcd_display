class LcdDisplay

  def initialize(number)
    @number = number
  end

  def render
    lcd_nums = get_lcd_nums
    puts "=" * 80
    5.times do |i|
      lcd_nums.each do |num|
        print num.graphic_digit[i], " "
      end
      print "\n"
    end
    puts "=" * 80
  end

  private

  def get_lcd_nums
    nums = []
    @number.each_char { |digit| nums << LCDNum.new(digit.to_i) }
    nums
  end

end

class LCDNum

  attr_accessor :graphic_digit

  def initialize(digit)
    @digit = digit
    @graphic_digit = graphic_num[@digit]
  end

  def graphic_num
    [
      [
        ' _ ',
        '| |',
        '   ',
        '| |',
        " - "
      ],
      [
        '   ',
        '  |',
        '   ',
        '  |',
        '   '
      ],
      [
        ' _ ',
        '  |',
        ' - ',
        '|  ',
        ' - '
      ],
      [
        ' _ ',
        '  |',
        ' - ',
        '  |',
        ' - '
      ],
      [
        '   ',
        '| |',
        ' - ',
        '  |',
        '   '
      ],
      [
        ' _ ',
        '|  ',
        ' - ',
        '  |',
        ' - '
      ],
      [
        ' _ ',
        '|  ',
        ' - ',
        '| |',
        ' - '
      ],
      [
        ' _ ',
        '  |',
        '   ',
        '  |',
        '   '
      ],
      [
        ' _ ',
        '| |',
        ' - ',
        '| |',
        ' - '
      ],
      [
        ' _ ',
        '| |',
        ' - ',
        '  |',
        ' - '
      ]

    ]
  end
end

num = ARGV[0]
if num.scan(/^\d+$/).any?
  LcdDisplay.new(num).render
else
  puts "Ошибка! Нужно передавать только целые числа (вначале может быть 0 (ноль)"
end
