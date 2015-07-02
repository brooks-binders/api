module V1
  class BindersController < ApplicationController
    before_action :set_binder, only: [:show, :update, :destroy]

    # GET /binders
    def index
      @binders = Binder.includes(:links).where(user_id: current_user.id).references(:links)
      render json: @binders
    end

    # GET /binders/1
    def show
      render json: @binder
    end

    # POST /binders
    def create
      @binder = Binder.new(binder_params)

      if @binder.save
        render json: @binder, status: :created
      else
        render json: @binder.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /binders/1
    def update
      if @binder.update(binder_params)
        head :no_content
      else
        render json: @binder.errors, status: :unprocessable_entity
      end
    end

    # DELETE /binders/1
    def destroy
      @binder.destroy

      head :no_content
    end

    private

      def set_binder
        @binder = Binder.find(params[:id])
        head :unauthorized unless @binder.user_id == current_user.id
        rescue ActiveRecord::RecordNotFound
                render json: { error: "Resource not found" }, status: :not_found
      end

      def binder_params
        params.require(:binder).permit(:name, :description, :export_path)
      end
  end
end
