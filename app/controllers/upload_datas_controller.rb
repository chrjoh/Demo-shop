class UploadDatasController < ApplicationController

  def index
    @upload_datas = UploadData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @upload_datas }
    end
  end

  def show
    @upload_data = UploadData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload_data }
    end
  end

  def new
    @upload_data = UploadData.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload_data }
    end
  end

  def edit
    @upload_data = UploadData.find(params[:id])
  end

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

  def destroy
    @upload_data = UploadData.find(params[:id])
    @upload_data.destroy

    respond_to do |format|
      format.html { redirect_to(upload_datas_url) }
      format.xml  { head :ok }
    end
  end
end
