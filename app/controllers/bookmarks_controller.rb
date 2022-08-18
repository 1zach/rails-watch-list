class BookmarksController < ApplicationController
    
    def index
        @bookmarks = Bookmark.all
    end

    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new 
    end

    def create
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new(bookmark_params)
        @bookmark.list = @list
        @bookmark.save
        redirect_to list_path(@list)
        #if @bookmark.save
        #redirect_to lists_path(@list)
        #else
        #render :new
        #end
    end

    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.delete
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(:list_id, :movie_id, :comment)
    end
end
