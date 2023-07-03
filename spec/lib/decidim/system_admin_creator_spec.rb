# frozen_string_literal: true

require "spec_helper"
require "decidim/system_admin_creator"

module Decidim
  describe SystemAdminCreator do
    let(:email) { "john@example.org" }
    let(:password) { "decidim123456" }

    let(:environment) do
      {
        "email" => email,
        "password" => password
      }
    end

    it "creates admin" do
      expect { described_class.create!(environment) }.to change(Decidim::System::Admin, :count).by(1)
      expect(Decidim::System::Admin.last.email).to eq(email)
    end

    context "when email already exists" do
      before do
        Decidim::System::Admin.create!(email: email, password: password)
      end

      it "does not create a new system admin and retrieve the previous one" do
        expect { described_class.create!(environment) }.not_to change(Decidim::System::Admin, :count)
        expect(Decidim::System::Admin.last.email).to eq(email)
      end
    end

    context "when some system admins had been created since the last update" do
      before do
        Decidim::System::Admin.create!(email: email, password: password)
        Decidim::System::Admin.create!(email: "foo@bar.org", password: "decidim123456")
        Decidim::System::Admin.create!(email: "john@doe.org", password: "decidim123456")
      end

      it "retrieves the one with the same email" do
        create_admin = -> { described_class.create!(environment) }
        expect(&create_admin).not_to change(Decidim::System::Admin, :count)
        expect(&create_admin).not_to(change { Decidim::System::Admin.find_by(email: email).id })
      end
    end
  end
end
