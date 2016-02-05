class CompanyDecorator < JsonDecorator
  def to_json(_option)
    json.merge(job_path: jobs_api_company_path(model)).to_json
  end
end
