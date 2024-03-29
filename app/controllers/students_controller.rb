class StudentsController < ApplicationController

before_action :set_student, only:[:show, :update, :destroy, :edit]

  def new
    @student = Student.new
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def index
    @students = Student.all
  end

  def create
   
    @student = Student.new(student_params)
    #@student = Student.new(params[:student])
    respond_to do |format|
      if @student.save

        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }

      end
    end
  end
    def update 
      respond_to do |format|
        if @student.update(student_params)
          format.html{redirect_to @student, notic: 'student was updated'}
          format.json{head :no_content}
        end
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
    end

  def student_params
    params.require(:student).permit(:name, :rollno, :program, :email)
  end

  private

  def set_student
    @student= Student.find(params[:id])
  end
end
