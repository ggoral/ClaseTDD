class OCRReader
  attr_reader :file

  def initialize(path)
    @file = File.open path, 'r'
  end

  def lines
    @lines ||= File.readlines(@file.path).map { |s| s.chomp }
  end

  def valid?
    lines.size % 4 == 0 &&
    lines.all? { |line| line.size == 27 } &&
    lines.join =~ /^[\s|_]*$/ &&
    lines.values_at(*(3..lines.size - 1).step(4)).all? { |line| line =~ /^\s*$/ }
  end
end
