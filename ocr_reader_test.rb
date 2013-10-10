require 'minitest/autorun'

require_relative 'ocr_reader'

class OCRReaderTest < Minitest::Test
  def test_initialize
    ocr = OCRReader.new 'fixtures/valid'
    assert_instance_of OCRReader, ocr
    assert_instance_of File, ocr.file
  end

  def test_initialize_with_invalid_file
    assert_raises Errno::ENOENT do 
      OCRReader.new 'this_is_not_a_file'
    end
  end

  def test_valid_syntax
    ocr = OCRReader.new 'fixtures/valid'
    assert ocr.valid?
  end

  def test_invalid_with_less_lines
    ocr = OCRReader.new 'fixtures/less_lines'
    refute ocr.valid?
  end

  def test_invalid_with_less_characters
    ocr = OCRReader.new 'fixtures/less_characters'
    refute ocr.valid? 
  end	

  def test_invalid_with_invalid_chars
    ocr = OCRReader.new 'fixtures/invalid_chars'
    refute ocr.valid? 
  end

  def test_invalid_with_non_empty_last_line
    ocr = OCRReader.new 'fixtures/non_empty_last_line'
    refute ocr.valid? 
  end
end 
