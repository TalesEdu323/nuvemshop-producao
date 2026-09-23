{# Temas Nuvemshop - templates/home.tpl #}
{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
{% set has_video = settings.video_embed %}
{% set has_main_categories = settings.slider_categories and settings.slider_categories is not empty %}
{% set has_banners = settings.banner and settings.banner is not empty %}
{% set has_featured_banner = "featured-banner.jpg" | has_custom_image or "featured-banner-mobile.jpg" | has_custom_image %}
{% set has_promotional_banners = settings.banner_promotional and settings.banner_promotional is not empty %}
{% set has_image_and_text_module = settings.module and settings.module is not empty %}
{% set has_brands = settings.brands and settings.brands is not empty %}
{% set has_banner_products = "banner_products.jpg" | has_custom_image %}
{% set has_informative_banners = settings.banner_services and settings.banner_services is not empty %}
{% set has_welcome_message = settings.welcome_message %}

{% set show_help = not has_main_slider and not has_mobile_slider and not has_video and not has_main_categories and not has_banners and not has_featured_banner and not has_promotional_banners and not has_image_and_text_module and not has_brands and not has_banner_products and not has_informative_banners and not has_welcome_message %}

{# Only remove this if you want to take away the example data #}
{% if show_help %}
	{% include "snipplets/defaults/show_help.tpl" %}
{% else %}

	{# Seletor de ordenação de seções configurado no settings.txt #}
	{% set newArray = [] %}

	{% for i in 1..25 %}
        {% set section = 'home_order_position_' ~ i %}
        {% set section_select = attribute(settings, section) %}

        {% if section_select not in newArray %}
            {# --- 1. Carrossel 3D em Destaque (Institucional Thiago Pessoa) --- #}
            {% if section_select == 'carousel_destaque' %}
                {% if settings.carousel_destaque_enable %}
                    {% include "snipplets/home/carousel-destaque.tpl" %}
                {% endif %}

            {# --- 2. Carrossel 3D de Experiências com Links (5 Fotos) --- #}
            {% elseif section_select == 'carousel_link' %}
                {% if settings.carousel_exp_enable is not defined or settings.carousel_exp_enable %}
                    {% include "snipplets/home/carousel-link.tpl" %}
                {% endif %}

            {# --- 3. Carrossel 3D de Avaliações (Google & Agendamento) --- #}
            {% elseif section_select == 'reviews_carousel' %}
                {% if settings.reviews_carousel_enable is not defined or settings.reviews_carousel_enable %}
                    {% include "snipplets/home/carrosel-avaliacao.tpl" %}
                {% endif %}

            {% else %}
                {% include 'snipplets/home/home-section-switch.tpl' %}
            {% endif %}

            {% set newArray = newArray|merge([section_select]) %}
        {% endif %}
	{% endfor %}

	{# Seções ocultas para pré-visualização no editor do tema da Nuvemshop #}
	{% if sections_unfold %}
		<div class="js-sections-unfold-container" style="display: none;">
			{% for section_select in ['slider', 'carousel_destaque', 'carousel_link', 'reviews_carousel', 'informatives', 'main_categories', 'categories', 'promotional', 'grid', 'featured_banner', 'banner_products', 'products', 'new', 'sale', 'promotion', 'best_seller', 'main_product', 'brands', 'testimonials', 'faq', 'video', 'institutional', 'welcome', 'instafeed', 'blog', 'extra_menu', 'newsletter', 'modules'] %}
				{% if section_select not in newArray %}
					{% if section_select == 'carousel_destaque' %}
						{% include "snipplets/home/carousel-destaque.tpl" %}
					{% elseif section_select == 'carousel_link' %}
						{% include "snipplets/home/carousel-link.tpl" %}
					{% elseif section_select == 'reviews_carousel' %}
						{% include "snipplets/home/carrosel-avaliacao.tpl" %}
					{% else %}
						{% include 'snipplets/home/home-section-switch.tpl' %}
					{% endif %}
				{% endif %}
			{% endfor %}
		</div>
	{% endif %}

{% endif %}