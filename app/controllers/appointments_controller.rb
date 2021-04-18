class AppointmentsController < ApplicationController

    get "/appointments" do
      if current_user 
        @appointments = Appointment.all
        erb :"appointments/index"
        end
      end
    
      get "/appointments/new" do
        erb :"appointments/new"
        
      end

      #create
    post "/appointments" do
      if params[:name] == "" || params[:technician] == "" || params[:appointment] == ""
        redirect to "/appointments/new"
      else 
        @appointment = Appointment.new(params[:appointments])
        ## verify no SQL injection
        if @appointment.save
          redirect to "/appointments/#{@appointment.id}"
        else 
          redirect to "/appointment/new"
        end
      end 
      end

      get "/appointments/:id" do
        erb :"/appointments/show"
      end

      get "/appointments/:id/edit" do
        erb :"appointments/edit"
      end

      #update
      patch "/appointments/:id" do
      end

      #delete
      delete "/appointments/:id" do
      end
      
end