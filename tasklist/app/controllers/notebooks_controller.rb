class NotebooksController < ApplicationController
  def index
    @notebooks = Notebook.all
  end

  def new
    @notebook = Notebook.new
  end

  def edit
    find_notebook
    if @notebook.nil?
      flash[:error] = "Can't find Notebook"
      redirect_to root_path
    end
  end

  def create
    @notebook = Notebook.new(notebook_params)
    if @notebook.save
      flash[:success] = "Notebook created. Ok"
      redirect_to notebook_params
    else
      flash[:error] = "Notebook can't be created"
      render 'new'
    end
  end

  def destroy
    find_notebook
    if @notebook.destroy
      flash[:success] = "Notebook destroyed successfully"
    else
      flash[:error] = "Notebook can't be destroyed"
    end
    redirect_to notebook_path
  end

  def update
    find_notebook
    if @notebook.update(notebook_params)
      flash[:success] = "Notebook updated. Ok"
      redirect_to notebook_path
    else
      #flash[:error] = "Notebook can't be updated"
      render 'edit'
    end
  end

  def show
    find_notebook
    if @notebook.nil?
      flash[:error] = "Can't be find Notebook"
      redirect_to root_path
    end
  end

private

def find_notebook
  @notebook = Notebook.find_by(id: params[:id])
end

def notebook_params
  params.require(:notebook).permit(:subject, :user_id, :create_date)
end


end
