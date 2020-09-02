class ResidencesController < ApplicationController

    before_action :set_residence, only: [:show]
   
    def show
        @info_syndics = current_user.info_syndics.order("info_syndics.created_at DESC")
        authorize @residence
        @title = "Copro"
    end

    private

    def set_residence
        @residence = Residence.find(params[:id])
    end

end
