class DashboardStudent::CourseController < ApplicationController
  before_action :authorize_request
  
  def index
    @course = Course.find(params[:course_id])

    render json: @course
  end

  def student_subscription_courses
    @student = Student.find(params[:student_id])
    @subscriptions = Subscription.where(student_id: @student.id)

    render json: { subscriptions: @subscriptions }, status: :ok
  end
    

  def subscribe_course
    @course = Course.find(params[:course_id])
    @student = Student.find(params[:student_id])

    subscription = Subscription.new(
      student_id: @student.id,
      course_id: @course.id
    )

    if subscription.save
      render json: { subscription: subscription }, status: :created
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity
    end
  end

  def new_comment
    course_id = params[:course_id]
    lesson_id = params[:lesson_id]
    student_id = params[:student_id]
    content = params[:content]
    
    if lesson_id.present? && student_id.present? && content.present? then
      comment = Comment.new(
        student_id: student_id,
        lesson_id: lesson_id,
        content: content
      )

      respond_to do |format|
        if comment.save
          format.html { redirect_to dashboard_student_course_path(course_id), notice: "Comentário feito com sucesso!" }
        else
          format.html { redirect_to dashboard_student_course_path(course_id), notice: "Erro ao comentar, tente novamente!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_student_course_path(course_id), notice: "Comentário não pode ser em branco!" }
      end
    end
  end

  def delete_comment
    course_id = params[:course_id]
    student_id = params[:student_id]
    comment_id = params[:comment_id]

    if course_id.present? && comment_id.present? then
      student = Student.find(student_id)
      comment = Comment.find(comment_id)

      if Comment.find_by(student_id: student).present? then
        comment.destroy
        respond_to do |format|
          format.html { redirect_to dashboard_student_course_path(course_id), notice: "Comentário excluído com sucesso!" }
        end
      end
    end
  end
end
