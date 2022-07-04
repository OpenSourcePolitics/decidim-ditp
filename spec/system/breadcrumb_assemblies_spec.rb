# frozen_string_literal: true

require "spec_helper"
require "decidim/core/test/shared_examples/has_contextual_help"

describe "Assemblies", type: :system do
  let(:organization) { create(:organization) }
  let(:assembly) do
    create(
      :assembly,
      :with_type,
      organization: organization,
      description: { en: "Description", ca: "Descripció", es: "Descripción" },
      short_description: { en: "Short description", ca: "Descripció curta", es: "Descripción corta" },
      show_statistics: true
    )
  end

  let!(:proposals_component) { create(:component, :published, participatory_space: assembly, manifest_name: :proposals) }
  let!(:meetings_component) { create(:component, :published, participatory_space: assembly, manifest_name: :meetings) }
  let!(:accountability_component) { create(:component, :published, participatory_space: assembly, manifest_name: :accountability) }
  let!(:proposals) { create_list(:proposal, 3, component: proposals_component) }
  let!(:results) { create_list(:result, 3, component: accountability_component) }

  before do
    allow(Decidim).to receive(:component_manifests).and_return([
                                                                 proposals_component.manifest,
                                                                 meetings_component.manifest,
                                                                 accountability_component.manifest
                                                               ])
    switch_to_host(organization.host)
    visit decidim_assemblies.assembly_path(assembly)
  end

  it "renders a breadcrumb" do
    within ".fr-breadcrumb" do
      expect(page).to have_content "Home"
      expect(page).to have_content(translated(assembly.title))
    end
  end

  context "when visiting proposals component" do
    before do
      click_link translated(proposals_component.name)
    end

    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content(translated(assembly.title))
        expect(page).to have_content translated(proposals_component.name)
      end
    end
  end

  context "when visiting meetings component" do
    before do
      click_link translated(meetings_component.name)
    end

    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content(translated(assembly.title))
        expect(page).to have_content translated(meetings_component.name)
      end
    end
  end

  context "when assembly has a parent" do
    let(:assembly) do
      create(
        :assembly,
        :with_parent,
        :with_type,
        organization: organization,
        description: { en: "Description", ca: "Descripció", es: "Descripción" },
        short_description: { en: "Short description", ca: "Descripció curta", es: "Descripción corta" },
        show_statistics: true
      )
    end

    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content(translated(assembly.parent.title))
        expect(page).to have_content(translated(assembly.title))
      end
    end
  end

  context "when visiting results component" do
    before do
      click_link translated(accountability_component.name)
    end

    it "renders a breadcrumb" do
      within ".fr-breadcrumb" do
        expect(page).to have_content "Home"
        expect(page).to have_content(translated(assembly.title))
        expect(page).to have_content translated(accountability_component.name)
      end
    end
  end
end
