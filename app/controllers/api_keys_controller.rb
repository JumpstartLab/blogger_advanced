class ApiKeysController < ApplicationController
  before_action :require_author

  def index
    @api_keys = current_author.api_keys
  end

  def create
    current_author.api_keys.create(token: SecureRandom.hex)

    redirect_to api_keys_path, notice: "Your API Key has been created."
  end

  def destroy
    current_author.api_keys.find(params[:id]).destroy

    redirect_to api_keys_path, notice: "Your API Key has been deleted."
  end
end
