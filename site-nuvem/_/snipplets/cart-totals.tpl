{# Check if store has free shipping without regions or categories #}

{% set has_free_shipping = cart.free_shipping.cart_has_free_shipping or cart.free_shipping.min_price_free_shipping.min_price %}
{% set has_free_shipping_bar = has_free_shipping and cart.free_shipping.min_price_free_shipping.min_price_raw > 0 %}

{% if has_free_shipping_bar %}
  
  {# includes free shipping progress bar: only if store has free shipping with a minimum #}
  
  {% if cart_page %}
    <div class="d-block d-md-none">
  {% endif %}
      {% include "snipplets/shipping/shipping-free-rest.tpl" %}
  {% if cart_page %}
    </div>
  {% endif %}

{% endif %}

{# IMPORTANT Do not remove this hidden subtotal, it is used by JS to calculate cart total #}
<div class="js-subtotal-price subtotal-price hidden" data-priceraw="{{ cart.subtotal }}"></div>

{# Used to assign currency to total #}
<div id="store-curr" class="hidden">{{ cart.currency }}</div>
    
{# Cart panel subtotal #}
<div class="js-visible-on-cart-filled cart-panel-subtotal pt-3 pb-4 px-2 form-row {% if not cart_page %}row no-gutters{% else %}text-right{% endif %} mb-1 {% if cart_page %}text-center-xs{% endif %}" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>
  <span class="col text-left">
    {{ "Subtotal" | translate }}
    {% if settings.shipping_calculator_cart_page %}
      <small>{{ " (sin envío)" | translate }}</small>
    {% endif %}
    :
  </span>
  <strong class="js-ajax-cart-total js-cart-subtotal {% if not cart_page %}col{% endif %} text-right" data-priceraw="{{ cart.subtotal }}" data-component="cart.subtotal" data-component-value={{ cart.subtotal }}>{{ cart.subtotal | money }}</strong>
</div>

{# Cart panel promos #}
<div class="js-total-promotions mb-3">
  <span class="js-promo-discount" style="display:none;"> {{ "Descuento" | translate }}</span>
  <span class="js-promo-in" style="display:none;">{{ "en" | translate }}</span>
  <span class="js-promo-all" style="display:none;">{{ "todos los productos" | translate }}</span>
  <span class="js-promo-buying" style="display:none;"> {{ "comprando" | translate }}</span>
  <span class="js-promo-units-or-more" style="display:none;"> {{ "o más" | translate }}</span>
  {% for promotion in cart.promotional_discount.promotions_applied %}
    {% if not promotion.is_subscription_promotion %}
      {% if(promotion.scope_value_id) %}
        {% set id = promotion.scope_value_id %}
      {% else %}
        {% set id = 'all' %}
      {% endif %}
        <span class="js-total-promotions-detail-row row px-3" id="{{ id }}">
          <div class="total-promotions-detail col-12 px-0">
            <span class="col">
              {% if promotion.discount_script_type != "custom" %}
                {% if promotion.discount_script_type == "NAtX%off" %}
                  {{ promotion.selected_threshold.discount_decimal_percentage * 100 }}% OFF
                {% elseif promotion.isBuyXPayY %}
                  {{ promotion.buy }}x{{ promotion.pay }}
                {% elseif promotion.isCrossSelling %}
                  {{ "Descuento" | translate }}
                {% else %}
                  {{ promotion.discount_script_type }}
                {% endif %}

                {{ "en" | translate }} {% if id == 'all' %}{{ "todos los productos" | translate }}{% else %}{{ promotion.scope_value_name }}{% endif %}

                {% if promotion.discount_script_type == "NAtX%off" %}
                  <span>{{ "Comprando {1} o más" | translate(promotion.selected_threshold.quantity) }}</span>
                {% endif %}
              {% else %}
                {{ promotion.scope_value_name }}
              {% endif %}
              :
            </span>
            <span class="col-auto text-right cart-promotion-number">-{{ promotion.total_discount_amount_short }}</span>
          </div>
        </span>
    {% endif %}
  {% endfor %}
</div>

{% if settings.shipping_calculator_cart_page %}

  <div class="js-visible-on-cart-filled js-has-new-shipping js-shipping-calculator-container mb-3">

    {# Saved shipping not available #}

    <div class="js-shipping-method-unavailable alert alert-warning form-row" style="display: none;">
      <div>
        <strong>{{ 'El medio de envío que habías elegido ya no se encuentra disponible ' | translate }}</strong>{{ 'porque el total de los items del carrito superan el peso máximo.' | translate }}
      </div>
      <div>
        {{ '¡No te preocupes! Podés elegir otro medio de envío.' | translate}}
      </div>
    </div>

    {# Shipping calculator and branch link #}

    <div id="cart-shipping-container" class="cart-panel-shipping-calculator" {% if cart.items_count == 0 %} style="display: none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

      {# Used to save shipping #}

      <span id="cart-selected-shipping-method" data-code="{{ cart.shipping_data.code }}" class="hidden">{{ cart.shipping_data.name }}</span>

      {# Shipping Calculator #}

      {% if store.has_shipping %}
        <div class="cart-shipping">
          {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_show': settings.shipping_calculator_cart_page, 'product_detail': false} %}
        </div>
      {% endif %}

      {# Store branches #}

      {% if store.branches %}

        {# Link for branches #}

        {% include "snipplets/shipping/branches.tpl" with {'product_detail': false} %}
      {% endif %}
    </div>
  </div>

{% endif %}

{{ component('nubesdk-slot', { type: "after_cart_summary" }) }}

  {# Cart panel total #}

  <div class="js-cart-total-container js-visible-on-cart-filled px-3" {% if cart.items_count == 0 %}style="display:none;"{% endif %} data-store="cart-total">
    <div class="row {% if cart_page %}no-gutters{% endif %} mb-3 h4">
      <span class="col-auto {% if cart_page %}pl-md-0{% endif %}">{{ "Total" | translate }}:</span>
      <span class="js-cart-total {% if cart.free_shipping.cart_has_free_shipping %}js-free-shipping-achieved{% endif %} {% if cart.shipping_data.selected %}js-cart-saved-shipping{% endif %} col text-right {% if cart_page %}pr-md-0{% endif %} font-weight-bold" data-component="cart.total" data-component-value={{ cart.total }}>{{ cart.total | money }}</span>
      <span class="col-12 {% if cart_page %}pr-md-0{% endif %}">
        {{ component('payment-discount-price', {
            visibility_condition: settings.payment_discount_price,
            location: 'cart',
            container_classes: 'text-accent font-small font-weight-normal mt-1 text-right',
          }) 
        }}

        {% if not settings.payment_discount_price %}
          {{ component('installments', {'location': 'cart', 'short_wording' : true, container_classes: { installment: "font-small font-weight-normal mt-1 text-right"}}) }}
        {% endif %}
      </span>
    </div>

    {# IMPORTANT Do not remove this hidden total, it is used by JS to calculate cart total #}
    <div class='total-price hidden'>
      {{ "Total" | translate }}: {{ cart.total | money }}
    </div>
  </div>

  <div class="js-visible-on-cart-filled {% if cart_page %}container-fluid{% endif %}" {% if cart.items_count == 0 %}style="display:none;"{% endif %}>

    {# No stock alert #}
    <div id="error-ajax-stock" class='alert alert-warning' role='alert' style="display:none;">
      {{ "¡Uy! No tenemos más stock de este producto para agregar este producto al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link">{{ "ver otros acá" | translate }}</a>
    </div>

    {% if cart_page %}
    <div class="row justify-content-end">
      <div class="col">
    {% endif %}

    {# Cart panel CTA #}
    
    {% set cart_total = (settings.cart_minimum_value * 100) %}

    {{ component('nubesdk-slot', { type: "before_go_to_checkout" }) }}

    <div class="row">
        <div class="js-ajax-cart-submit col-12 mb-2" {{ cart.total < cart_total ? 'style="display:none"' }} id="ajax-cart-submit-div">
          <input class="btn btn-primary d-block w-100" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" data-component="cart.checkout-button"/>
        </div>

        {# Cart panel continue buying link #}
        
        {% if settings.continue_buying %}
          <div class="col-12">
              <a href="{% if template == 'category' or (settings.cart_continue_action == "modal" and not cart_page) %}#{% else %}{{ store.products_url }}{% endif %}" class="d-block {% if template == 'category' or (settings.cart_continue_action == "modal" and not cart_page) %}js-modal-close js-fullscreen-modal-close {% endif %}btn btn-medium btn-opacity-05 btn-bold">{{ 'Ver más productos' | translate }}</a>
          </div>        
        {% endif %}
    </div>

    {{ component('nubesdk-slot', { type: "after_go_to_checkout" }) }}

    {# Cart minium alert #}

    <div class="js-ajax-cart-minimum alert alert-warning mt-4" {{ cart.subtotal >= cart_total ? 'style="display:none"' }} id="ajax-cart-minumum-div">
      {{ "El monto mínimo de compra es de {1} sin incluir el costo de envío" | t(cart_total | money) }}
    </div>

    <input type="hidden" id="ajax-cart-minimum-value" value="{{ cart_total }}"/>

    {% if cart_page %}
      </div>
    </div>
    {% endif %}
</div>
