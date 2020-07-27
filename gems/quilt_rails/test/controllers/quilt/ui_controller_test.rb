# frozen_string_literal: true

require 'test_helper'
require 'rails/generators'
require 'generators/quilt/rails_setup/rails_setup_generator'

module Quilt
  class UiControllerTest < ActionDispatch::IntegrationTest
    def run(*)
      Rails.env.stub(:test?, false) { super } # NOTE: Bypass DoNotIntegrationTestError
    end

    setup { boot_dummy }

    test "react render error" do
      get("/")

      assert_select("h1", "Waiting for React Sever to boot up.")
      assert_select("meta[http-equiv='refresh']") do |selector, *|
        assert_equal("3;URL='/'", selector[:content])
      end
    end

    private

    def boot_dummy
      require_relative "../../dummy/config/environment"
    end
  end
end
