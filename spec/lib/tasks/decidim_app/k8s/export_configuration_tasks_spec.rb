# frozen_string_literal: true

require "spec_helper"

describe "rake decidim_app:k8s:export_configuration", type: :task do
  let(:image) { "dummy-image" }

  before do
    allow(DecidimApp::K8s::ConfigurationExporter).to receive(:export!).with(image).and_return(true)
  end

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end

  it "invokes the configuration exporter" do
    with_modified_env IMAGE: image do
      task.execute
    end
  end
end
