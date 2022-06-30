# frozen_string_literal: true

module ApplicationHelper
  def render_static_page_breadcrumb
    content_tag :div, class: "row column" do
      content_tag :div, class: "breadcrumb" do
        concat(link_to(t("home", scope: "decidim.breadcrumb"), decidim.root_path))
        concat(link_to(t("pages", scope: "decidim.breadcrumb"), decidim.pages_path))
        concat(link_to translated_attribute(@topic.title), decidim.page_path(@pages.first)) if @topic
        concat(link_to translated_attribute(@page.title), decidim.page_path(@page))
      end
    end
  end

  def render_assembly_breadcrumb
    content_tag :div, class: "row column" do
      content_tag :div, class: "breadcrumb" do
        concat(link_to(t("home", scope: "decidim.breadcrumb"), decidim.root_path))
        concat(link_to(translated_attribute(current_participatory_space.title), Decidim::Assemblies::Engine.routes.url_helpers.assembly_path(current_participatory_space)))
        #translated_attribute(current_component.name)) if try(:current_component)
      end
    end
  end
end
