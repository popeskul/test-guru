class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index create]
  before_action :find_test, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = current_user.tests.new
  end

  def create
    @test = current_user.tests.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to [:admin, @test], notice: 'Test created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: 'Test edited!'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  def search
    result = ["Class #{params.class}", "Parameters #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
