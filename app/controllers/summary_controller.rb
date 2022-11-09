class SummaryController < ApplicationController
  def index
    summary = []

    single_donations = SingleDonation.all
    summary.append(*single_donations)
    generated_donations = GeneratedDonation.all
    summary.append(*generated_donations)

    summary = summary.sort { |a,b| a.created_at <=> b.created_at }
    
    @donation_summary = summary
  end
end