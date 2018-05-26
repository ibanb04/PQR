class NotificationsController < ApplicationController
    
    before_action :set_notification, only: [:edit, :update, :destroy]
    
    def index
    @notifications = Notification.all
    end

    def new
        @notification = Notification.new
    end
    
    def create
        @notification = Notification.new(notification_params)
            if @notification.save
                redirect_to notifications_path
            else
                render :new
            end
    end

    def edit
    end

    def update
        if @notification.update(notification_params)
            redirect_to notifications_path
        else
            render :edit
        end
    end

    def destroy
        @notification.destroy
        redirect_to notifications_path
    end

    private
        def notification_params
        params.require(:notification).permit(:message, :pqr_id, :user_id)
        end

    def set_notification
        @notification = Notification.find(params[:id])
    end

end
