class SearchesController < ApplicationController
  def search
    @model   = params[:model] # User か Book
    @content = params[:content] # 検索クエリ
    @method  = params[:method] # 一致タイプ

    if @model == 'user'
      @result = User.search_for(@content, @method)
    else
      @result = Book.search_for(@content, @method)
    end
  end
end
