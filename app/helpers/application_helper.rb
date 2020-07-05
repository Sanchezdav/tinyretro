module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: "is-primary",
      error: "is-danger",
      alert: "is-warning",
      notice: "is-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
