class CandidaturesController < ApplicationController
  def index
    candidatures = CandidatureResource.all(params)
    respond_with(candidatures)
  end

  def show
    candidature = CandidatureResource.find(params)
    respond_with(candidature)
  end

  def create
    candidature = CandidatureResource.build(params)

    if candidature.save
      render jsonapi: candidature, status: 201
    else
      render jsonapi_errors: candidature
    end
  end

  def update
    candidature = CandidatureResource.find(params)

    if candidature.update_attributes
      render jsonapi: candidature
    else
      render jsonapi_errors: candidature
    end
  end

  def destroy
    candidature = CandidatureResource.find(params)

    if candidature.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: candidature
    end
  end
end
