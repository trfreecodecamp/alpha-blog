class ArticlesController < ApplicationController
    def show
        #byebug
       @article = Article.find(params[:id]) 
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id]) 
    end

    def create 
        #Render back to the browser screen instead of saving
        #render plain: params[:article]

        #save to the db
        # Need to whitelist by using Strong parameters
        @article = Article.new(params.require(:article).permit(:title, :description))
 
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
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy 
        #This has to be linked to something in the view index.html.erb
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end
end