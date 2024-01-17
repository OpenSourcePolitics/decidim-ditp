# frozen_string_literal: true

require "spec_helper"

describe "rake scaleway:storage:migrate_from_local", type: :task do
  before do
    allow(ActiveStorage::Migrator).to receive(:migrate!).with(:local, :scaleway).and_return(true)
  end

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include "environment"
  end

  it "invokes the migrator" do
    task.execute
  end
end
