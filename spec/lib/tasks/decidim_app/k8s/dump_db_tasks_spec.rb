# frozen_string_literal: true

require "spec_helper"

describe "rake decidim_app:k8s:dump_db", type: :task do
  before do
    allow(DecidimApp::K8s::ConfigurationExporter).to receive(:dump_db).and_return(true)
  end

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end

  it "invokes the configuration exporter" do
    task.execute
  end
end
