# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :check_is_contribute_user, only: %i[edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.all.order(:id).page(params[:page]).per(5)
  end

  # GET /reports/1 or /reports/1.json
  def show; end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit; end

  # POST /reports or /reports.json
  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to @report, notice: t('views.common.created_report')
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('views.common.updated_reprt')
    else
      render :edit
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('views.common.destroyed_report')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:title, :content)
  end

  def check_is_contribute_user
    if current_user != @report.user
      redirect_to reports_path
      flash[:alert] = t('controllers.common.notice_alert')
    end
  end
end
