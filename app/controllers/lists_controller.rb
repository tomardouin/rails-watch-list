class ListsController < ApplicationController

    def index
        @lists = List.all
    end

    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
    end

    def create
        @lists = List.all
        @list = List.new(list_param)
        if @list.save
            redirect_to list_path(@list)
          else
            render :new, status: :unprocessable_entity
          end
    end

    def destroy
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_path, status: :see_other
    end

    private

    def list_param
        params.require(:list).permit(:name, :photo)
    end
end
