class OCRReader

  attr_reader :file
  def initialize(path)
    @file = File.open path, 'r'
  end

  def lines_count
    File.readlines(@file.path).size
  end

  def lines
    File.readlines(@file.path)
  end

  def valid?
    lines_count % 4 == 0 && 
      lines.all? { |line| line.size == 28 } &&
      lines.map{| s | s.chomp }.join =~ /^[\s|_]*$/
  end

end
