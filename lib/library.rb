class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    books.any? { |book| book.title == title }
  end

  # def card_catalogue
  #
  #
  #   array = []
  #   books.map do |lname|
  #     array << lname.author_last_name
  #     array
  #     # binding.pry
  #   end
  # end
  # def find_by_author(name)
  #   full_name = {}
  #   books.find {|name| name.author_first_name}
  # end

  def find_all_books_by_author(author_name)
    books.find_all do |book|
      author_name == "#{book.author_first_name} #{book.author_last_name}"
    end
  end

  def find_by_author(author_name)
    authors = {}
    find_all_books_by_author(author_name).each {|book|authors[book.title] = book}
    authors
  end
end
