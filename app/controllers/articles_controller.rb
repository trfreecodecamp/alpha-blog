class ArticlesController < ApplicationController
    #Apply method set_article to all these methods first
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def show
        #byebug
        #replace with before_action
       #@article = Article.find(params[:id]) 
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create 
        #Render back to the browser screen instead of saving
        #render plain: params[:article]

        #save to the db
        # Need to whitelist by using Strong parameters
        @article = Article.new(article_params)
 
        #redirect_to article_path(@article)
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            #Go back to the new template
            #Any instance vars from the controller will be available
            # ie @article
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy 
        #This has to be linked to something in the view index.html.erb
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
end