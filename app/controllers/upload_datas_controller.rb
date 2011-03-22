class UploadDatasController < ApplicationController
  # GET /upload_datas
  # GET /upload_datas.xml
  def index
    @upload_datas = UploadData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @upload_datas }
    end
  end

  # GET /upload_datas/1
  # GET /upload_datas/1.xml
  def show
    @upload_data = UploadData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload_data }
    end
  end

  # GET /upload_datas/new
  # GET /upload_datas/new.xml
  def new
    @upload_data = UploadData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload_data }
    end
  end

  # GET /upload_datas/1/edit
  def edit
    @upload_data = UploadData.find(params[:id])
  end

  # POST /upload_datas
  # POST /upload_datas.xml
  def create
    @upload_data = UploadData.new(params[:upload_data])

    respond_to do |format|
      if @upload_data.save
        format.html { redirect_to(@upload_data, :notice => 'Upload data was successfully created.') }
        format.xml  { render :xml => @upload_data, :status => :created, :location => @upload_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @upload_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /upload_datas/1
  # PUT /upload_datas/1.xml
  def update
    @upload_data = UploadData.find(params[:id])

    respond_to do |format|
      if @upload_data.update_attributes(params[:upload_data])
        format.html { redirect_to(@upload_data, :notice => 'Upload data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @upload_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_datas/1
  # DELETE /upload_datas/1.xml
  def destroy
    @upload_data = UploadData.find(params[:id])
    @upload_data.destroy

    respond_to do |format|
      format.html { redirect_to(upload_datas_url) }
      format.xml  { head :ok }
    end
  end
end
