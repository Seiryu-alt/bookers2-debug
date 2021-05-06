class SearchController < ApplicationController
  def search
    keyword = params[:keyword]

    if params[:search_target] == "Book"
      target_model = Book
      target_column = "title"
    else
      target_model = User
      target_column = "name"
    end

    case params[:match_type]
    when "1"
      @search_keyword = params[:keyword]
    when "2"
      @search_keyword = params[:keyword] + "%"
    when "3"
      @search_keyword = "%" + params[:keyword]
    else "4"
      @search_keyword = "%" + params[:keyword] + "%"
    end

    @results = target_model.where("#{target_column} like ?", @search_keyword)
    puts "----------------------params------------------------"
    p @results.model == User
    puts "----------------------------------------------------"

  end
end
