class EntriesController < ApplicationController


def index
	@entries = Entry.all
end


def show
	@entry = Entry.find(params[:id])
end


def new
	@entry = Entry.new
end


def create
	@entry = Entry.new(entry_params)
	if @entry.save
		redirect_to entry_path(@entry)
	else
		render :new
	end
end


def edit
	@entry = Entry.find(params[:id])
end


def update
	@entry = Entry.find(params[:id])
	if @entry.update(entry_params)
		redirect_to entry_path(@entry)
	else
		render :edit
	end

end


def destroy
	@entry = Entry.find(params[:id])
	@entry.destroy
	redirect_to root_path

end

private

def entry_params
	params.require(:entry).permit(:author_name, :photo_url)
end

end