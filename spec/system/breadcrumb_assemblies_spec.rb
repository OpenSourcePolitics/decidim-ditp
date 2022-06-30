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
  let!(:meetings_component) { create(:component, :unpublished, participatory_space: assembly, manifest_name: :meetings) }

  before do
    create_list(:proposal, 3, component: proposals_component)
    allow(Decidim).to receive(:component_manifests).and_return([proposals_component.manifest, meetings_component.manifest])
    switch_to_host(organization.host)
    visit decidim_assemblies.assembly_path(assembly)
  end

  it "renders a breadcrumb" do
    within ".breadcrumb" do
      expect(page).to have_content "Home"
      expect(page).to have_content(translated(assembly.title))
    end
  end
end
