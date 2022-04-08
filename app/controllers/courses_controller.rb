class CoursesController < ApplicationController
  before_action :authenticate_user!
  layout 'user'
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @lesson = Lesson.new
    @course_users = Subscription.where(course_id: @course.id)
    @students = Student.where.not(id: @course_users.pluck(:student_id))
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_section
    course_id = params[:course_id]
    section_name = params[:section_name]

    if course_id.present? && section_name.present? then
      section = Section.new(name: section_name, course_id: course_id)

      respond_to do |format|
        if section.save
          format.html { redirect_to course_path(course_id), notice: "Sessão criada com sucesso!" }
        else
          format.html { redirect_to course_path(course_id), notice: "Erro ao criar Sessão!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Sessão não pode ficar em branco!" }
      end
    end
  end

  def update_section
    course_id = params[:course_id]
    section_name = params[:section_name]
    section_id = params[:section_id]

    if section_id.present? && section_name.present? then
      section = Section.find(section_id)
      section.update(
        name: section_name
      )

      respond_to do |format|
        if section.save
          format.html { redirect_to course_path(course_id), notice: "Sessão atualizada com sucesso!" }
        else
          format.html { redirect_to course_path(course_id), notice: "Erro ao criar Sessão!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Corrija os Campos!" }
      end
    end
  end

  def destroy_section
    course_id = params[:course_id]
    section_id = params[:section_id]

    if section_id.present? then
      section = Section.find(section_id)
      section.destroy

      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Sessão Excluída com sucesso!" }
      end
    end
  end

  def add_video_section
    course_id = params[:course_id]
    section_id = params[:section_id]
    title = params[:lesson][:title].present? ? params[:lesson][:title] : "Aula sem título"
    content = params[:lesson][:content]

    if course_id.present? && section_id.present? && title.present? then
      lesson = Lesson.new(
        section_id: section_id, 
        title: title, 
        content: content, 
        video: params[:lesson][:video],
        thumbnail: params[:lesson][:thumbnail]
      )

      respond_to do |format|
        if lesson.save
          format.html { redirect_to course_path(course_id), notice: "Upload feito com sucesso!" }
        else
          format.html { redirect_to course_path(course_id), notice: "Erro ao criar Sessão!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Título não pode ficar em Branco!" }
      end
    end
  end

  def update_video_section
    course_id = params[:course_id]
    lesson_id = params[:lesson_id]
    title = params[:lesson][:title]
    content = params[:lesson][:content]

    if lesson_id.present? && title.present? then
      lesson = Lesson.find(lesson_id)
      lesson.update(title: title, content: content)

      if params[:lesson][:thumbnail].present? then
        lesson.update(thumbnail: params[:lesson][:thumbnail])
      end

      if params[:lesson][:video].present? then
        lesson.update(video: params[:lesson][:video])
      end

      if params[:lesson][:lesson_resources].present? then
        lesson.update(lesson_resources: params[:lesson][:lesson_resources])
      end

      respond_to do |format|
        if lesson.save
          format.html { redirect_to course_path(course_id), notice: "Upload feito com sucesso!" }
        else
          format.html { redirect_to course_path(course_id), notice: "Erro ao criar Sessão!" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Título não pode ficar em Branco!" }
      end
    end
  end

  def delete_video_section
    course_id = params[:course_id]
    lesson_id = params[:lesson_id]

    if lesson_id.present? then
      lesson = Lesson.find(lesson_id)
      lesson.destroy

      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Video Excluído com sucesso!" }
      end
    end
  end

  def delete_comment_student
    course_id = params[:course_id]
    comment_id = params[:comment_id]

    if comment_id.present? then
      comment = Comment.find(comment_id)
      comment.destroy

      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Comentário Excluído com sucesso!" }
      end
    end
  end

  def delete_lesson_resource
    @attachment = ActiveStorage::Attachment.find(params[:id])
    @attachment.purge
    
    respond_to do |format|
      format.html { redirect_to course_path(params[:course_id]), notice: "Recurso Excluído com sucesso!" }
    end
  end

  def add_student_to_course
    course_id = params[:course_id]
    student_id = params[:student][:student_id]

    if course_id.present? && student_id.present? then
      course = Course.find(course_id)
      student = Student.find(student_id)

      subscription = Subscription.new(course_id: course_id, student_id: student_id)

      if subscription.save
        respond_to do |format|
          format.html { redirect_to course_path(course_id), notice: "Aluno adicionado com sucesso!" }
        end
      end
    end
  end

  def remove_student_from_course
    course_id = params[:course_id]
    student_id = params[:student_id]

    if course_id.present? && student_id.present? then
      course = Course.find(course_id)
      student = Student.find(student_id)

      subscription = Subscription.where(course_id: course_id, student_id: student_id)

      subscription.destroy_all

      respond_to do |format|
        format.html { redirect_to course_path(course_id), notice: "Aluno removido com sucesso!" }
      end
    end
  end

  def move_to_up
    move_up(params[:course_id], params[:section_id])
  end

  def move_to_bottom
    move_bottom(params[:course_id], params[:section_id])
  end

  def move_to_up_video
    move_up_video(params[:course_id], params[:lesson_id])
  end

  def move_to_bottom_video
    move_bottom_video(params[:course_id], params[:lesson_id])
  end

  private

  def move_up(course_id, section_id)
    Section.find(section_id).move_higher
    respond_to_moves(course_id)
  end

  def move_up_video(course_id, lesson_id)
    Lesson.find(lesson_id).move_higher
    respond_to_moves(course_id)
  end

  def move_bottom(course_id, section_id)
    Section.find(section_id).move_lower
    respond_to_moves(course_id)
  end

  def move_bottom_video(course_id, lesson_id)
    Lesson.find(lesson_id).move_lower
    respond_to_moves(course_id)
  end

  def respond_to_moves(course_id)
    respond_to do |format|
      format.html { redirect_to course_path(course_id), notice: "Sessão movida com sucesso!" }
    end
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :subtitle, :content, :image_course)
  end
end
