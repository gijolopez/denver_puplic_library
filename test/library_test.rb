require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test

  def test_if_it_exists
    dpl = Library.new
    assert_instance_of Library, dpl
  end

  def test_if_it_initializes_with_an_empty_books_array
    dpl = Library.new

    assert_equal [], dpl.books
  end

  def test_add_to_collection_checks_if_adds_book_to_library
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")

    dpl.add_to_collection(jane_eyre)

    assert_equal [jane_eyre], dpl.books
    assert_equal 1, dpl.books.count
  end

  def test_it_can_many_books_collection
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert_equal [jane_eyre, mockingbird, villette],dpl.books
    assert_equal 3, dpl.books.count
  end

  def test_include_method
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)

    assert dpl.include?("To Kill a Mockingbird")
    refute dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_card_catalogue_in_order_by_last_name
    skip
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(villette)

    assert_equal ["Bronte", "Bronte", "Lee"], dpl.card_catalogue.last
  end

  def test_it_can_find_by_author
    dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(jane_eyre)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(villette)
    result = dpl.find_by_author("Charlotte Bronte")

    assert_instance_of Book, result.values[0]
    assert_equal "October 16, 1847", result.values[0].publication_date
    assert_equal "1853", result.values[1].publication_date
  end

end
