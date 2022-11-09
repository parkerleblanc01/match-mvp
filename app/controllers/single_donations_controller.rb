class SingleDonationsController < ApplicationController
  before_action :set_single_donation, only: %i[ show edit update destroy ]

  # GET /single_donations or /single_donations.json
  def index
    @single_donations = SingleDonation.all
  end

  # GET /single_donations/1 or /single_donations/1.json
  def show
  end

  # GET /single_donations/new
  def new
    @single_donation = SingleDonation.new
  end

  # GET /single_donations/1/edit
  def edit
  end

  # POST /single_donations or /single_donations.json
  def create
    donor = Donor.create_or_update(
      first_name: donar_params[:first_name],
      last_name: donar_params[:last_name],
      email: donar_params[:email],
    )

    @single_donation = SingleDonation.new(single_donation_params)
    @single_donation.donor = donor

    respond_to do |format|
      if @single_donation.save
        format.html { redirect_to single_donation_url(@single_donation), notice: "Single donation was successfully created." }
        format.json { render :show, status: :created, location: @single_donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @single_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /single_donations/1 or /single_donations/1.json
  def update
    donor = Donor.create_or_update(
      first_name: donar_params[:first_name],
      last_name: donar_params[:last_name],
      email: donar_params[:email],
    )

    @single_donation.donor = donor

    respond_to do |format|
      if @single_donation.update(single_donation_params)
        format.html { redirect_to single_donation_url(@single_donation), notice: "Single donation was successfully updated." }
        format.json { render :show, status: :ok, location: @single_donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @single_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /single_donations/1 or /single_donations/1.json
  def destroy
    @single_donation.destroy

    respond_to do |format|
      format.html { redirect_to single_donations_url, notice: "Single donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_single_donation
      @single_donation = SingleDonation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def single_donation_params
      params.require(:single_donation).permit(:amount)
    end

    def donar_params
      params.require(:single_donation).permit(:first_name, :last_name, :email)
    end
end
