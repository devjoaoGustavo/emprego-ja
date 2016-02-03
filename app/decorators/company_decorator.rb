class CompanyDecorator < SimpleDelegator

  def to_json(option)
    JSON.parse(__getobj__.to_json)
        .merge(job_path: "/#{option[:prefixes][0]}/#{__getobj__.id}/jobs")
            .to_json
  end

end
