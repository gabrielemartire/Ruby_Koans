require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutIteration < Neo::Koan

  in_ruby_version("1.9", "2", "3") do
    def as_name(name)
      name.to_sym
    end
  end

  def test_each_is_a_method_on_arrays
    assert_equal true, [].methods.include?(:each)
    assert_equal true, [].methods.include?(as_name("each"))
  end

  def test_iterating_with_each
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    assert_equal 6, sum
  end

  def test_each_can_use_curly_brace_blocks_too
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    assert_equal 6, sum
  end

  def test_break_works_with_each_style_iterations
    array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    sum = 0
    array.each do |item|
      break if item > 3
      sum += item
    end
    assert_equal 6, sum
  end

  def test_collect_transforms_elements_of_an_array
    array = [1, 2, 3]
    new_array = array.collect { |item| item + 10 }
    assert_equal [11,12,13], new_array

    # NOTE: 'map' is another name for the 'collect' operation
    another_array = array.map { |item| item + 10 }
    assert_equal [11,12,13], another_array
  end

  def test_select_selects_certain_items_from_an_array
    array = [1, 2, 3, 4, 5, 6]

    even_numbers = array.select { |item| (item % 2) == 0 }
    assert_equal [2, 4, 6], even_numbers

    # NOTE: 'find_all' is another name for the 'select' operation
    more_even_numbers = array.find_all { |item| (item % 2) == 0 }
    assert_equal [2, 4, 6], more_even_numbers
  end

  def test_find_locates_the_first_element_matching_a_criteria
    array = ["Jim", "Bill", "Clarence", "Doug", "Eli"]

    assert_equal "Clarence", array.find { |item| item.size > 4 }
  end

  def test_inject_will_blow_your_mind
    result = [2, 3, 4].inject(0) { |sum, item| sum + item }
    assert_equal 9, result
    # .inject(0) => sum = 0
    # 1° num = 2) sum + 2 => 0 + 2 => sum = 2
    # 2° num = 3) sum + 3 => 2 + 3 => sum = 5
    # 1° num = 4) sum + 4 => 5 + 4 => sum = 9

    result2 = [2, 3, 4].inject(1) { |product, item| product * item }
    assert_equal 24, result2
    # .inject(1) => sum = 1
    # 1° num = 2) sum * 2 => 1 * 2 => sum = 2  
    # 2° num = 3) sum * 3 => 2 * 3 => sum = 6
    # 1° num = 4) sum * 4 => 6 * 4 => sum = 24

    result = [2, 3, 4].inject(1) { |sum, item| sum + item }
    assert_equal 10, result
    # .inject(1) => sum = 1
    # 1° num = 2) sum + 2 => 1 + 2 => sum = 3
    # 2° num = 3) sum + 3 => 3 + 3 => sum = 6
    # 1° num = 4) sum + 4 => 6 + 4 => sum = 10

    result2 = [2, 3, 4].inject(0) { |product, item| product * item }
    assert_equal 0, result2
    # .inject(0) => sum = 0
    # 1° num = 2) sum * 2 => 0 * 2 => sum = 0
    # 2° num = 3) sum * 3 => 0 * 3 => sum = 0
    # 1° num = 4) sum * 4 => 0 * 4 => sum = 0
  end

  def test_all_iteration_methods_work_on_any_collection_not_just_arrays
    # Ranges act like a collection
    #NOTA (1..3) = [1, 2, 3]
    result = (1..3).map { |item| item + 10 }
    assert_equal [11, 12, 13], result

    # Files act like a collection of lines
    File.open("example_file.txt") do |file|
      upcase_lines = file.map { |line| line.strip.upcase }
      assert_equal ["THIS", "IS", "A", "TEST"], upcase_lines
    end
  end

  # Bonus Question:  In the previous koan, we saw the construct:
  #
  #   File.open(filename) do |file|
  #     # code to read 'file'
  #   end
  #
  # Why did we do it that way instead of the following?
  #
  #   file = File.open(filename)
  #   # code to read 'file'
  #
  # When you get to the "AboutSandwichCode" koan, recheck your answer.
  #NOTA risposta pre "AboutSandwichCode" koan: per non accedere 2 volte allo stesso file e risparmiare risorse

end
