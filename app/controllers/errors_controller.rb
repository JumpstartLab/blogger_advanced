class ErrorsController < ApplicationController
  def show
    @exception = env['action_dispatch.exception']
    render request.path[1..-1]
  end
end
