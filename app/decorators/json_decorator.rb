class JsonDecorator < SimpleDelegator
  include Rails.application.routes.url_helpers

  def json
    JSON.parse(model.to_json)
  end

  def model
    __getobj__
  end
end
