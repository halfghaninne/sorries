class ApologiesController < ApplicationController
  # GET /apologies
  # GET /apologies.json
  def index
    @apologies = Apology.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apologies }
    end
  end

  # GET /apologies/1
  # GET /apologies/1.json
  def show
    @apology = Apology.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apology }
    end
  end

  # GET /apologies/new
  # GET /apologies/new.json
  def new
    @apology = Apology.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apology }
    end
  end

  # GET /apologies/1/edit
  def edit
    @apology = Apology.find(params[:id])
  end

  # POST /apologies
  # POST /apologies.json
  def create
    @apology = Apology.new(params[:apology])

    respond_to do |format|
      if @apology.save
        format.html { redirect_to @apology, notice: 'Apology was successfully created.' }
        format.json { render json: @apology, status: :created, location: @apology }
      else
        format.html { render action: "new" }
        format.json { render json: @apology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /apologies/1
  # PUT /apologies/1.json
  def update
    @apology = Apology.find(params[:id])

    respond_to do |format|
      if @apology.update_attributes(params[:apology])
        format.html { redirect_to @apology, notice: 'Apology was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @apology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apologies/1
  # DELETE /apologies/1.json
  def destroy
    @apology = Apology.find(params[:id])
    @apology.destroy

    respond_to do |format|
      format.html { redirect_to apologies_url }
      format.json { head :no_content }
    end
  end
end
