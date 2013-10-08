#!/usr/bin/env ruby
# coding: utf-8

require 'minitest/autorun'
require_relative 'ocr_reader'
class OCRReaderTest < Minitest::Test
  
  def test_should_initialize_correctly
    ocr = OCRReader.new 'useCase1'
    assert_instance_of OCRReader, ocr
    assert_instance_of File, ocr.file
  end

  def test_should_not_initialize_correctly
    assert_raises Errno::ENOENT do 
      OCRReader.new 'this_is_not_a_file'
    end
  end
  
  def test_should_be_valid
    ocr = OCRReader.new 'useCase1'
    assert ocr.valid?
  end

  def test_not_valid
    ocr = OCRReader.new 'useCase2'
    refute ocr.valid?
  end

  def test_should_validate_line_size
    ocr = OCRReader.new 'useCase3'
    refute ocr.valid? 
  end	

  def test_should_have_valid_character
    ocr = OCRReader.new 'useCase4'
    refute ocr.valid? 
  end

  def test_should_valid_four_line_empty
    ocr = OCRReader.new 'useCase5'
    refute ocr.valid? 
  end
  
end 
