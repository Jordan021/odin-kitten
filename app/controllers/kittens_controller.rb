class KittensController < ApplicationController
  
  def new 
    @kitten = Kitten.new
  end 

  def create 
    @kitten = Kitten.new(kitten_params)
    if @kitten.save 
      flash[:success] = "Kitten successfully saved"
      redirect_to root_url
    else 
      render 'new'
    end 
  end

  def index 
    @kitten = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end 
  end 

  def show 
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end 
  end 

  def edit
    @kitten = Kitten.find(params[:id])
  end 

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Kitten successfully edited"
      redirect_to @kitten 
    else 
      render 'edit'
    end 
  end 

  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.destroy
      flash[:success] = "Kitten Removed"
      redirect_to root_url
    end 
  end 

  private 

  def kitten_params 
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end 

end
