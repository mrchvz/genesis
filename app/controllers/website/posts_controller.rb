module Website
  class PostsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments
    before_action :generate_archive


    def index
      # params[:year] ||= DateTime.now.year
      # params[:month] ||= DateTime.now.month

      @posts = Post.where(
        organization: current_organization,
        status: :PUBLISHED
      ).order(published_at: :desc)
    end

    def show
      @post = Post.find_by(
        organization: current_organization,
        status: :PUBLISHED,
        id: params[:id]
      )
    end

    private

    def generate_archive
      @archive = {}

      year_groups = Post.where(
        organization: current_organization,
        status: :PUBLISHED
      ).group_by { |p| p.created_at.beginning_of_year }

      year_groups.each do |year_datetime, posts|
        month_groups = Post.where(
          id: posts.map(&:id)
        ).group_by { |p| p.created_at.beginning_of_month }

        @archive[year_datetime.year] = {
          count: posts.count,
          objects: posts,
          months: month_groups.map do |month_datetime, posts|
            [
              month_datetime.month,
              {
                count: posts.count,
                objects: posts
              }
            ]
          end.to_h
        }
      end
    end
  end
end
