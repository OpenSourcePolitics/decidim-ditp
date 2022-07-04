# frozen_string_literal: true

module ApplicationHelper
  def render_static_page_breadcrumb(topic, page, pages)
    content_tag :div, class: "row column" do
      content_tag :nav, class: "fr-breadcrumb" do
        content_tag :div, class: "fr-collapse", id: "breadcrumb-pages" do
          content_tag :ol, class: "fr-breadcrumb__list no-bullet-indented" do
            concat(content_tag(:li, link_to(t("home", scope: "decidim.breadcrumb"), decidim.root_path)))
            concat(content_tag(:li, link_to(t("pages", scope: "decidim.breadcrumb"), decidim.pages_path)))
            concat(content_tag(:li, link_to(translated_attribute(topic.title), decidim.page_path(pages.first)))) if topic
            concat(content_tag(:li, link_to(translated_attribute(page.title), decidim.page_path(page))))
          end
        end
      end
    end
  end

  def render_assembly_breadcrumb
    content_tag :div, class: "row column" do
      content_tag :nav, class: "fr-breadcrumb" do
        content_tag :div, class: "fr-collapse", id: "breadcrumb-pages" do
          content_tag :ol, class: "fr-breadcrumb__list no-bullet-indented" do
            concat(content_tag(:li, link_to(t("home", scope: "decidim.breadcrumb"), decidim.root_path)))
            if current_participatory_space.parent.present?
              concat(content_tag(:li, link_to(translated_attribute(current_participatory_space.parent.title), breadcrumb_assembly_path(current_participatory_space.parent))))
            end
            concat(content_tag(:li, link_to(translated_attribute(current_participatory_space.title), breadcrumb_assembly_path(current_participatory_space))))
            if try(:current_component)
              concat(content_tag(:li,
                                 link_to(translated_attribute(current_component.name), Decidim::EngineRouter.main_proxy(current_component).root_path)))
            end
          end
        end
      end
    end
  end

  def breadcrumb_assembly_path(path)
    Decidim::Assemblies::Engine.routes.url_helpers.assembly_path(path)
  end
end
