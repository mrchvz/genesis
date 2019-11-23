module Website
  class TreatmentsController < WebsiteController
    before_action :load_phones
    before_action :load_treatments

    def index
    end

    def show
      @treatment = Item.find_by!(
        organization: @current_organization,
        key: params[:id].gsub('-', '_')
      )
      @item_testimonial_mappings = ItemTestimonialMapping.where(
        organization: @current_organization,
        item: @treatment
      )
      @testimonials = Testimonial.where(
        organization: @current_organization,
        id: @item_testimonial_mappings.pluck(:id),
        status: :ACCEPTED
      )
      @external_testimonials = @testimonials.where(
        source: :EXTERNAL
      ).order(
        date: :desc
      ).limit(10)
      @internal_testimonials = @testimonials.where(
        source: :INTERNAL
      ).order(
        date: :desc
      ).limit(9)
    end
  end
end
