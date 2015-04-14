class TestModelsController < ApplicationController
  before_action :set_test_model, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @test_models = TestModel.all
    respond_with(@test_models)
  end

  def show
    respond_with(@test_model)
  end

  def new
    @test_model = TestModel.new
    respond_with(@test_model)
  end

  def edit
  end

  def create
    @test_model = TestModel.new(test_model_params)
    @test_model.save
    respond_with(@test_model)
  end

  def update
    @test_model.update(test_model_params)
    respond_with(@test_model)
  end

  def destroy
    @test_model.destroy
    respond_with(@test_model)
  end

  private
    def set_test_model
      @test_model = TestModel.find(params[:id])
    end

    def test_model_params
      params.require(:test_model).permit(:task)
    end
end
