# frozen_string_literal: true

require "spec_helper"

describe "rake decidim_app:k8s:upgrade", type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end

  it "calls db:migrate" do
    allow(Rake::Task["db:migrate"]).to receive(:invoke)

    task.execute
  end
end
