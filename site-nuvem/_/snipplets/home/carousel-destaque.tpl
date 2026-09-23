{# ============================================================================== #}
{# SNIPPLET: snipplets/home/carousel-destaque.tpl                                   #}
{# Seção Institucional com Carrossel 3D - Thiago Pessoa / Joalheria Autoral       #}
{# ============================================================================== #}

{# 1. Mapeamento das imagens cadastradas no Personalizador de Tema (settings.txt) #}
{% set available_slides = [] %}

{% for i in 1..5 %}
  {% set pad = (i < 10 ? '0' ~ i : '' ~ i) %}
  {% set img_name = 'carousel_destaque_' ~ pad ~ '.jpg' %}
  {% set img_alt = 'carousel_destaque_' ~ i ~ '.jpg' %}
  
  {% if img_name | has_custom_image %}
    {% set available_slides = available_slides | merge([{
      'index': i,
      'img_key': img_name,
      'title': attribute(settings, 'carousel_destaque_' ~ pad ~ '_title'),
      'subtitle': attribute(settings, 'carousel_destaque_' ~ pad ~ '_subtitle'),
      'url': attribute(settings, 'carousel_destaque_' ~ pad ~ '_url'),
      'btn': attribute(settings, 'carousel_destaque_' ~ pad ~ '_btn')
    }]) %}
  {% elseif img_alt | has_custom_image %}
    {% set available_slides = available_slides | merge([{
      'index': i,
      'img_key': img_alt,
      'title': attribute(settings, 'carousel_destaque_' ~ i ~ '_title'),
      'subtitle': attribute(settings, 'carousel_destaque_' ~ i ~ '_subtitle'),
      'url': attribute(settings, 'carousel_destaque_' ~ i ~ '_url'),
      'btn': attribute(settings, 'carousel_destaque_' ~ i ~ '_btn')
    }]) %}
  {% endif %}
{% endfor %}

{# Inclusão do CSS exclusivo do componente #}
{{ 'css/carousel-destaque.css' | static_url | css_tag }}

{# Estilos incorporados diretamente para garantir que o layout lado a lado e o botão funcionem de imediato, sem depender de cache do navegador ou do FTP #}
<style>
:root {
  --ns-card-w: 320px;
  --ns-card-h: 440px;
  --ns-side-scale: 0.84;
  --ns-overlap: 100px;
  --ns-radius: 16px;
  --ns-gold: #d6bb89;
  --ns-gold-hover: #c9ad79;
  --ns-text-dark: #1a1a1a;
  --ns-text-body: #374151;
  --ns-active-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
  --ns-side-shadow: 0 10px 30px rgba(0, 0, 0, 0.16);
}

.ns-split-section {
  position: relative !important;
  width: 100% !important;
  max-width: 1400px !important;
  margin: 0 auto !important;
  padding: 50px 24px 40px !important;
  box-sizing: border-box !important;
  clear: both !important;
}

.ns-split-container {
  display: flex !important;
  flex-direction: row !important;
  align-items: center !important;
  justify-content: space-between !important;
  flex-wrap: nowrap !important;
  gap: 48px !important;
  width: 100% !important;
  box-sizing: border-box !important;
}

.ns-split-text-col {
  flex: 0 0 45% !important;
  width: 45% !important;
  max-width: 580px !important;
  text-align: left !important;
  box-sizing: border-box !important;
}

.ns-split-title {
  font-size: 34px !important;
  font-weight: 800 !important;
  color: #1a1a1a !important;
  line-height: 1.2 !important;
  margin: 0 0 16px 0 !important;
  letter-spacing: -0.02em !important;
}

.ns-split-subtitle {
  font-size: 17px !important;
  font-weight: 700 !important;
  color: #1a1a1a !important;
  line-height: 1.4 !important;
  margin: 0 0 18px 0 !important;
}

.ns-split-description p {
  font-size: 14.5px !important;
  line-height: 1.7 !important;
  color: #374151 !important;
  margin: 0 0 14px 0 !important;
}

.ns-split-description p:last-child {
  margin-bottom: 0 !important;
}

.ns-split-cta {
  margin-top: 26px !important;
}

.ns-split-btn {
  display: inline-block !important;
  background-color: #d6bb89 !important;
  color: #111111 !important;
  font-size: 15px !important;
  font-weight: 700 !important;
  padding: 14px 32px !important;
  border-radius: 6px !important;
  text-decoration: none !important;
  transition: all 0.25s ease !important;
  box-shadow: 0 4px 14px rgba(214, 187, 137, 0.35) !important;
  letter-spacing: -0.01em !important;
  text-align: center !important;
  cursor: pointer !important;
}

.ns-split-btn:hover {
  background-color: #c9ad79 !important;
  color: #000000 !important;
  transform: translateY(-2px) !important;
  box-shadow: 0 6px 18px rgba(214, 187, 137, 0.45) !important;
  text-decoration: none !important;
}

.ns-split-carousel-col {
  flex: 0 0 52% !important;
  width: 52% !important;
  min-width: 0 !important;
  position: relative !important;
  box-sizing: border-box !important;
}

.ns-carousel {
  position: relative !important;
  width: 100% !important;
  overflow: visible !important;
  user-select: none !important;
  -webkit-user-select: none !important;
}

.ns-track {
  position: relative !important;
  height: var(--ns-card-h) !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  perspective: 1000px !important;
}

.ns-slide {
  position: absolute !important;
  width: var(--ns-card-w) !important;
  height: var(--ns-card-h) !important;
  border-radius: var(--ns-radius) !important;
  overflow: hidden !important;
  background: #1e1e1e !important;
  transition: transform 0.55s cubic-bezier(0.22, 0.61, 0.36, 1), 
              opacity 0.55s ease, 
              box-shadow 0.55s ease,
              filter 0.55s ease !important;
  opacity: 0 !important;
  pointer-events: none !important;
  will-change: transform, opacity !important;
  box-shadow: var(--ns-side-shadow) !important;
}

.ns-slide-link {
  display: block !important;
  width: 100% !important;
  height: 100% !important;
  text-decoration: none !important;
  color: inherit !important;
}

.ns-slide img {
  width: 100% !important;
  height: 100% !important;
  object-fit: cover !important;
  display: block !important;
  pointer-events: none !important;
}

.ns-slide.is-active {
  opacity: 1 !important;
  pointer-events: auto !important;
  z-index: 5 !important;
  transform: translateX(0) scale(1) !important;
  box-shadow: var(--ns-active-shadow) !important;
  cursor: default !important;
  filter: brightness(1) !important;
}

.ns-slide.is-prev,
.ns-slide.is-next {
  opacity: 0.9 !important;
  pointer-events: auto !important;
  z-index: 3 !important;
  cursor: pointer !important;
  filter: brightness(0.92) !important;
}

.ns-slide.is-prev {
  transform: translateX(calc(-1 * (var(--ns-card-w) - var(--ns-overlap)))) scale(var(--ns-side-scale)) !important;
}

.ns-slide.is-next {
  transform: translateX(calc(var(--ns-card-w) - var(--ns-overlap))) scale(var(--ns-side-scale)) !important;
}

.ns-slide.is-prev:hover,
.ns-slide.is-next:hover {
  filter: brightness(1.05) !important;
}

.ns-nav {
  position: absolute !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  width: 44px !important;
  height: 44px !important;
  border-radius: 999px !important;
  border: 0 !important;
  background: rgba(255, 255, 255, 0.95) !important;
  color: #111111 !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  cursor: pointer !important;
  z-index: 10 !important;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2) !important;
  transition: transform 0.2s ease, background 0.2s ease !important;
  backdrop-filter: blur(4px) !important;
}

.ns-nav:hover {
  background: #111111 !important;
  color: #ffffff !important;
  transform: translateY(-50%) scale(1.08) !important;
}

.ns-prev { left: 4px !important; }
.ns-next { right: 4px !important; }

.ns-dots {
  display: flex !important;
  gap: 8px !important;
  justify-content: center !important;
  align-items: center !important;
  margin-top: 24px !important;
}

.ns-dot {
  width: 8px !important;
  height: 8px !important;
  border-radius: 999px !important;
  border: 0 !important;
  background: #d1d5db !important;
  cursor: pointer !important;
  padding: 0 !important;
  transition: all 0.3s ease !important;
}

.ns-dot.is-active {
  background: var(--ns-text-dark) !important;
  width: 24px !important;
}

.ns-split-divider {
  width: 100% !important;
  height: 1px !important;
  background: #ebdcc2 !important;
  margin-top: 50px !important;
}

@media (max-width: 900px) {
  .ns-split-container {
    flex-direction: column !important;
    align-items: stretch !important;
    gap: 36px !important;
  }
  .ns-split-text-col {
    flex: 1 1 100% !important;
    width: 100% !important;
    max-width: 100% !important;
  }
  .ns-split-carousel-col {
    flex: 1 1 100% !important;
    width: 100% !important;
    margin-top: 8px !important;
  }
}

@media (max-width: 640px) {
  :root {
    --ns-card-w: 240px;
    --ns-card-h: 340px;
    --ns-overlap: 70px;
    --ns-side-scale: 0.82;
  }
  .ns-split-section {
    padding: 36px 16px 28px !important;
  }
  .ns-split-title {
    font-size: 26px !important;
    margin-bottom: 14px !important;
  }
}
</style>

{# Textos institucionais do lado esquerdo (editáveis no painel de tema ou com os textos de Thiago Pessoa) #}
{% set sec_title = settings.carousel_destaque_section_title | default('Quem é Thiago Pessoa?') %}
{% set sec_subtitle = settings.carousel_destaque_section_subtitle | default('O ourives que transforma histórias em joias') %}
{% set sec_p1 = settings.carousel_destaque_section_p1 | default('Eu sou Thiago Pessoa, ourives e designer de joias. Sempre digo que a vida é feita de escolhas, mas, no meu caso, foi diferente: a ourivesaria me escolheu. Desde cedo, o fascínio pelo ouro e pelo brilho dos metais me levou a transformar matéria-prima em algo muito maior do que um acessório: uma joia com alma, que carrega memórias e significados.') %}
{% set sec_p2 = settings.carousel_destaque_section_p2 | default('Ao longo da minha trajetória, passei por grandes nomes da joalheria, como Vivara e Jack Vartanian, mas foi na criação autoral que encontrei minha verdadeira essência: produzir joias únicas por meio de experiências que tornam cada joia inesquecível para o cliente. Minha paixão está em dar vida a joias feitas para marcar momentos especiais. Cada detalhe, cada traço e cada escolha de material são pensados para traduzir histórias e sentimentos em ouro.') %}
{% set sec_p3 = settings.carousel_destaque_section_p3 | default('Aqui, cada joia vai além do brilho e do design. Ela se torna parte da sua história, um símbolo eterno do que realmente importa para você. Se você busca algo exclusivo, feito com propósito e significado, te convido a conhecer meu trabalho.') %}
{% set sec_btn_text = settings.carousel_destaque_section_btn_text | default('Vamos criar sua joia juntos?') %}
{% set sec_btn_url = settings.carousel_destaque_section_btn_url | default('https://wa.me/5500000000000') %}

<section class="ns-split-section" aria-label="{{ sec_title }}">
  <div class="ns-split-container">
    
    {# COLUNA ESQUERDA: Textos institucionais e Botão #}
    <div class="ns-split-text-col">
      {% if sec_title %}
        <h2 class="ns-split-title">{{ sec_title }}</h2>
      {% endif %}
      
      {% if sec_subtitle %}
        <h3 class="ns-split-subtitle">{{ sec_subtitle }}</h3>
      {% endif %}
      
      <div class="ns-split-description">
        {% if sec_p1 %}
          <p>{{ sec_p1 }}</p>
        {% endif %}
        {% if sec_p2 %}
          <p>{{ sec_p2 }}</p>
        {% endif %}
        {% if sec_p3 %}
          <p>{{ sec_p3 }}</p>
        {% endif %}
      </div>
      
      {% if sec_btn_text %}
        <div class="ns-split-cta">
          <a href="{{ sec_btn_url | setting_url }}" class="ns-split-btn">
            {{ sec_btn_text }}
          </a>
        </div>
      {% endif %}
    </div>

    {# COLUNA DIREITA: Carrossel 3D em Destaque #}
    <div class="ns-split-carousel-col">
      <div class="ns-carousel" id="nsCarousel" data-autoplay="{{ settings.carousel_destaque_autoplay | default(true) }}" data-interval="{{ settings.carousel_destaque_interval | default('4500') }}">
        
        {# Botão Anterior #}
        <button type="button" class="ns-nav ns-prev" aria-label="Slide anterior" id="nsPrevBtn">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="15 18 9 12 15 6"></polyline>
          </svg>
        </button>

        {# Trilho com os Slides #}
        <div class="ns-track" id="nsTrack">
          {% if available_slides | length > 0 %}
            {# MODO DINÂMICO: Fotos reais enviadas no personalizador da Nuvemshop #}
            {% for slide in available_slides %}
              <div class="ns-slide" data-index="{{ loop.index0 }}">
                {% if slide.url %}
                  <a href="{{ slide.url | setting_url }}" class="ns-slide-link" aria-label="{{ slide.title | default('Foto ' ~ loop.index) }}">
                {% endif %}
                  
                  <img 
                    src="{{ slide.img_key | static_url }}" 
                    alt="{{ slide.title | default(sec_title ~ ' - Foto ' ~ loop.index) }}"
                    loading="{{ loop.first ? 'eager' : 'lazy' }}"
                    width="320"
                    height="440"
                  />
                  
                  {% if slide.title or slide.subtitle %}
                    <div class="ns-slide-caption">
                      {% if slide.title %}
                        <h4 class="ns-slide-title">{{ slide.title }}</h4>
                      {% endif %}
                      {% if slide.subtitle %}
                        <p class="ns-slide-subtitle">{{ slide.subtitle }}</p>
                      {% endif %}
                    </div>
                  {% endif %}

                {% if slide.url %}
                  </a>
                {% endif %}
              </div>
            {% endfor %}
          {% else %}
            {# MODO DEMO: Mostra os slides de ateliê enquanto não houver fotos enviadas no painel #}
            
            <div class="ns-slide" data-index="0">
              <a href="#contato" class="ns-slide-link" aria-label="Joalheria Autoral">
                <img 
                  src="https://images.unsplash.com/photo-1531995811006-35cb42e1a022?w=900&q=80" 
                  alt="Thiago Pessoa - Joalheria Autoral e Ouro" 
                  loading="eager"
                  width="320"
                  height="440"
                />
              </a>
            </div>
            <div class="ns-slide" data-index="1">
              <a href="#contato" class="ns-slide-link" aria-label="Artesanal e Exclusivo">
                <img 
                  src="https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=900&q=80" 
                  alt="Thiago Pessoa - Ourivesaria na Bancada de Criação" 
                  loading="lazy"
                  width="320"
                  height="440"
                />
              </a>
            </div>
            <div class="ns-slide" data-index="2">
              <a href="#contato" class="ns-slide-link" aria-label="Propósito e Significado">
                <img 
                  src="https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=900&q=80" 
                  alt="Thiago Pessoa - Ateliê de Criação" 
                  loading="lazy"
                  width="320"
                  height="440"
                />
              </a>
            </div>
            <div class="ns-slide" data-index="3">
              <a href="#contato" class="ns-slide-link" aria-label="Design Sob Medida">
                <img 
                  src="https://images.unsplash.com/photo-1605100804763-247f67b3557e?w=900&q=80" 
                  alt="Alianças e Jóias sob Medida" 
                  loading="lazy"
                  width="320"
                  height="440"
                />
              </a>
            </div>
          {% endif %}
        </div>

        {# Botão Próximo #}
        <button type="button" class="ns-nav ns-next" aria-label="Próximo slide" id="nsNextBtn">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="9 18 15 12 9 6"></polyline>
          </svg>
        </button>

        {# Indicadores (Dots) #}
        <div class="ns-dots" id="nsDots" role="tablist" aria-label="Navegação por slides"></div>
      </div>
    </div>

  </div>
  
  {# Linha divisória dourada na base #}
  <div class="ns-split-divider"></div>
</section>

{# Inclusão do JavaScript funcional do carrossel #}
{{ 'js/carousel-destaque.js' | static_url | script_tag }}
