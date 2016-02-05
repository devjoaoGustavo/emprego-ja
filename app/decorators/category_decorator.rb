class CategoryDecorator < JsonDecorator
  def to_json(_option)
    json.merge(job_path: jobs_api_category_path(model)).to_json
  end
end
