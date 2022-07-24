module Api
  module V1
    class CoursesController < ApplicationController
      before_action :set_course, only: %i[ show ]
    
      # GET /api/v1/courses or /courses.json
      def index
        @courses = Course.all
    
        render json: @courses, each_serializer: CoursesSerializer
      end

      def show
        render json: @course, serializer: CourseSerializer
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.friendly.find(params[:id])
      end
    
      # Only allow a list of trusted parameters through.
      def course_params
        params.require(:course).permit(:name, :subtitle, :content, :image_course)
      end
    end
  end
end