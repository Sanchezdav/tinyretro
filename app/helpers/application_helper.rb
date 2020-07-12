module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: "is-primary",
      error: "is-danger",
      alert: "is-warning",
      notice: "is-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def serialize(template, options = {})
    JbuilderTemplate
      .new(self) { |json| json.partial! template, options }.attributes!
  end
end
