# frozen_string_literal: true

require "spec_helper"

describe "Breadcrumb Profile", type: :system do
  let(:user) { create(:user, :confirmed) }

  before do
    switch_to_host(user.organization.host)
    login_as user, scope: :user

    visit decidim.profile_path(user.nickname)
  end

  it "renders a breadcrumb" do
    within ".breadcrumb" do
      expect(page).to have_content "Home"
      expect(page).to have_content(user.nickname)
    end
  end
end
