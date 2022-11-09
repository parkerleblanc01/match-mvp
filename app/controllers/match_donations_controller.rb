class MatchDonationsController < ApplicationController
  before_action :set_match_donation, only: %i[ show edit update destroy ]

  # GET /match_donations or /match_donations.json
  def index
    @match_donations = MatchDonation.all
  end

  # GET /match_donations/1 or /match_donations/1.json
  def show
  end

  # GET /match_donations/new
  def new
    @match_donation = MatchDonation.new
  end

  # GET /match_donations/1/edit
  def edit
  end

  # POST /match_donations or /match_donations.json
  def create
    @match_donation = MatchDonation.new(match_donation_params)

    respond_to do |format|
      if @match_donation.save
        format.html { redirect_to match_donation_url(@match_donation), notice: "Match donation was successfully created." }
        format.json { render :show, status: :created, location: @match_donation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @match_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_donations/1 or /match_donations/1.json
  def update
    respond_to do |format|
      if @match_donation.update(match_donation_params)
        format.html { redirect_to match_donation_url(@match_donation), notice: "Match donation was successfully updated." }
        format.json { render :show, status: :ok, location: @match_donation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @match_donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_donations/1 or /match_donations/1.json
  def destroy
    @match_donation.destroy

    respond_to do |format|
      format.html { redirect_to match_donations_url, notice: "Match donation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_donation
      @match_donation = MatchDonation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def match_donation_params
      params.require(:match_donation).permit(:donor_id, :max_amount, :active, :per_donor_amount, :per_donation_amount)
    end
end
