class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index create update_inline]
  before_action :find_test, only: %i[show destroy edit update update_inline]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = current_user.tests.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :edit, alert: t('.error')
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path
    else
      redirect_to admin_tests_path, alert: t('.error')
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :passage_time)
  end

  def rescue_with_test_not_found
    render plain: t('.show.not_found')
  end
end
