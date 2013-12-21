module ServicesHelper
  def render_success(opts={})
    render json: { success: true }.merge(opts)
  end

  def render_failure(opts={})
    render json: { success: false }.merge(opts)
  end
end
