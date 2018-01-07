class ArticlesController < ApplicationController

 #http_basic_authenticate_with name: "saawan", password: "kumar", except: [:index, :show]

  def index
    @articles = Article.all
  end

 def show
    @article = Article.find(params[:id])
    #@sum = params[:a].to_f + params[:b].to_f
    # @id = params[:id]
    # @t = params[:test]
  end

  def new
   @article = Article.new
  end

def edit
  @article = Article.find(params[:id])
end
 
def create

  error_flag, @article = Article.create_article(article_params)
  if error_flag
    render 'new'
  else
    redirect_to @article
  end

end
 
def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
end



def get_articles

  article_array = Article.build_json_article_list(params[:start].to_i,params[:length].to_i)
  article_json = {"recordsFiltered"=> Article.count,"recordsTotal"=> Article.count, "data"=> article_array}
  respond_to do |format|
   format.json {render json: article_json}
  end 
  
end



 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
