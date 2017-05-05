class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :show, :update, :destroy]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def new
		@article = Article.new
	end
	def edit
		# @article = Article.find(params[:id])
	end
	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user = current_user
		# @article.save
		# redirect_to article_path(@article)
		if @article.save
			flash[:success] = "Article was created successfully."
			redirect_to article_path(@article)
		else
			render 'new'
		end

	end

	def update
		# @article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "Article was updated successfully."
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show
		# @article = Article.find(params[:id])
	end

	def destroy
		@article.destroy 
		flash[:danger] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title,:description)
		end
end