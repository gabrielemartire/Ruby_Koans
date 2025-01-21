require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutBlocks < Neo::Koan
  def method_with_block
    #NOTA yield comando fighissimo
    yield
  end

  def test_methods_can_take_blocks
    yielded_result = method_with_block { 1 + 2 }
    assert_equal 3, yielded_result
  end

  def test_blocks_can_be_defined_with_do_end_too
    yielded_result = method_with_block do 1 + 2 end
    assert_equal 3, yielded_result
  end

  # ------------------------------------------------------------------

  def method_with_block_arguments
    yield("Jim")
  end

  def test_blocks_can_take_arguments
    method_with_block_arguments do |argument|
      assert_equal "Jim", argument
    end
  end

  #NOTA test mio
  def meethod_invitati
    yield(["pippo", :pluto, {topolino: "paperino"}])
  end

  def test_compleanno
    partecipanti = []
    meethod_invitati do |arg|
      partecipanti << arg
    end
    assert_not_nil partecipanti
  end

  # ------------------------------------------------------------------

  def many_yields
    yield(:peanut)
    yield(:butter)
    yield(:and)
    yield(:jelly)
  end

  def test_methods_can_call_yield_many_times_asd
    result = []
    many_yields { |item| result << item }
    assert_equal [:peanut,:butter,:and,:jelly], result
  end

  # ------------------------------------------------------------------

  def yield_tester
    #NOTA yield with block_given?
    if block_given?
      yield
    else
      :no_block
    end
  end

  def test_methods_can_see_if_they_have_been_called_with_a_block
    assert_equal :with_block, yield_tester { :with_block }
    assert_equal :no_block, yield_tester
  end

  # ------------------------------------------------------------------

  def test_block_can_affect_variables_in_the_code_where_they_are_created
    value = :initial_value
    method_with_block { value = :modified_in_a_block }
    assert_equal :modified_in_a_block, value
  end

  #NOTA approfondimento, yield con variabili numeriche
  def fn_yeald
    return yield*2
  end

  def test_block_can_affect_variables_in_the_code_where_they_are_created_num
    value = 4
    fn_yeald { value = 5 }
    #NOTA non capisco quindi a cosa dovrebbe servire fare { value = 5 }
    #NOTA mi sembra solo confusionario vbb
    assert_equal 5, value
  end

  def test_blocks_can_be_assigned_to_variables_and_called_explicitly
    add_one = lambda { |n| n + 1 }
    #NOTA add_one.call(10) = add_one.call(n) quindi add_one = lambda { |10| 10 + 1 } => 11
    assert_equal 11, add_one.call(10)

    # Alternative calling syntax
    assert_equal 11, add_one[10]
  end

  def test_stand_alone_blocks_can_be_passed_to_methods_expecting_blocks
    make_upper = lambda { |n| n.upcase }
    result = method_with_block_arguments(&make_upper)
    assert_equal "JIM", result
  end

  # ------------------------------------------------------------------

  def method_with_explicit_block(&block)
    block.call(10)
  end

  def test_methods_can_take_an_explicit_block_argument
    assert_equal 20, method_with_explicit_block { |n| n * 2 } # => { |10| 10 * 2 } = 20
    #NOTA qua la n me la popola in metodo ma che cambia rispetto a fare return 10?

    add_one = lambda { |n| n + 1 }
    assert_equal 11, method_with_explicit_block(&add_one)
  end

end
