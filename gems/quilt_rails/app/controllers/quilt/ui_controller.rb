# frozen_string_literal: true

module Quilt
  class UiController < ApplicationController
    include Quilt::ReactRenderable

    rescue_from(Quilt::ReactRenderable::ReactServerNoResponseError) do
      render(:react_render_error, status: :internal_server_error)
    end

    def index
      render_react
    end
  end
end
