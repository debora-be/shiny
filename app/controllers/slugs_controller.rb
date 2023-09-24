class SlugsController < ApplicationController
    def index
        slugs = Slug.all
        render json: slugs
      end
      
      def show
        slug = Slug.find(params[:id])
        render json: slug
      end
      
      def create
        slug = Slug.new(slug_params)
        if slug.save
          render json: slug, status: :created
        else
          render json: slug.errors, status: :unprocessable_entity
        end
      end
      
      def update
        slug = Slug.find(params[:id])
        if slug.update(slug_params)
          render json: slug
        else
          render json: slug.errors, status: :unprocessable_entity
        end
      end
      
      def destroy
        slug = Slug.find(params[:id])
        slug.destroy
        head :no_content
      end
      
      private
      
      def slug_params
        params.require(:slug).permit(:name, :bio)
      end      
end
