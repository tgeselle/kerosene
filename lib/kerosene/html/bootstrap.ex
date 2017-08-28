defmodule Kerosene.HTML.Bootstrap do
  use Phoenix.HTML

  def generate_links(page_list, additional_class) do
    content_tag :div, class: "pagination" do
      content_tag :ul, class: "pagination__pages" do
        content_tag :li, class: build_html_class(additional_class) do
          for {label, _page, url, current} <- page_list do
            content_tag :div, class: build_html_class(current) do
              link "#{label}", to: url
            end
          end
        end
      end
    end
  end

  defp build_html_class(true), do: "is-active"
  defp build_html_class(false), do: nil
  defp build_html_class(additional_class) do
    String.trim("pagination #{additional_class}")
  end
end
