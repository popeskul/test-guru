class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_tests, only: %i[index create]
  before_action :find_test, only: %i[show destroy edit update start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def search
    result = ["Class #{params.class}", "Parameters #{params.inspect}"]

    render plain: result.join("\n")
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
