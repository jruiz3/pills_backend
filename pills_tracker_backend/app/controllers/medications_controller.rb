class MedicationsController < ApplicationController
  def index
    medications = Medication.all
    render json: MedicationSerializer.new(medications)
  end

  def show
    medication = Medication.find(params[:id])
    render json: MedicationSerializer.new(medication)
  end

  def create
    medication = Medication.new(m_params)

    render json: medication.save
  end

  def update
    @medication = Medication.find(params[:id])
    @medication.update(name: params["medication"]["name"])
    @medication.update(priceperpill: params["medication"]["priceperpill"])
    @medication.save
    render json: @medication
  end

  private

  def m_params
      params.permit(:name, :priceperpill)
  end

end
