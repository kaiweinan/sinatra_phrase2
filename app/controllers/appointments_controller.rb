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

    post "/appointments" do
      if params[:appointments][:name] == "" || params[:appointments][:technician] == "" || params[:appointments][:appointment] == ""
        redirect to "/appointments/new"
      else 

        @appointment = Appointment.new(params[:appointments])
        @appointment.user_id = session[:user_id]
        if @appointment.save
          redirect to "/appointments"
        else 
          redirect to "/appointment/new"
        end
      end 
    end

      get "/appointments/:id/edit" do
        @appointment = Appointment.find_by_id(params[:id])
        if @appointment.user == current_user
          erb :"/appointments/edit"
        else 
          rediect to "/appointments"
        end 
   
      end

      patch "/appointments/:id" do
        if params[:name] == "" || params[:technician] == "" || params[:appointment] == ""
          redirect to "/appointments/#{params[:id]}/edit"
        else 
          @appointment = Appointment.find_by_id(params[:id])
          @appointment.user == current_user
          if @appointment && @appointment.update(params[:appointments])
            redirect to "/appointments"
          else 
            redirect to "/appointments/#{params[:id]}/edit"
          end
        end 
      end

      delete "/appointments/:id/delete" do
        @appointment = Appointment.find_by_id(params[:id])
        @appointment.user == current_user
    if @appointment 
      @appointment.delete
    end
    redirect to "/appointments"
  end 
    
      
end