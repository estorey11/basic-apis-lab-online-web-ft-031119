class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "fb92150188f8f57a5e42"
    secret = "REPLACE ME"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
  end
end
