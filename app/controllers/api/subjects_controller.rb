class Api::SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
    render 'index.json.jb'
  end

  def show
    @subject = Subject.find(params[:id])
    render 'show.json.jb'
  end

end
