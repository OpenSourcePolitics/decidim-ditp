# frozen_string_literal: true

require "spec_helper"

describe "Breadcrumb Static pages", type: :system do
  let(:organization) { create(:organization) }
  let!(:page1) { create(:static_page, :with_topic, organization: organization) }

  before do
    switch_to_host(organization.host)
    visit decidim.page_path(page1)
  end

  context "when visiting a single page with topic" do
    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content translated(page1.topic.title)
        expect(page).to have_content translated(page1.title)
      end
    end
  end

  context "when visiting a single page without topic" do
    let!(:page1) { create(:static_page, organization: organization) }

    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content "Pages"
        expect(page).to have_content translated(page1.title)
      end
    end
  end
end
