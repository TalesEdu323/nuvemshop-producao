{# ============================================================================== #}
{# SNIPPLET: snipplets/home/carousel-link.tpl                                       #}
{# Seção "Experiências e serviços exclusivos" - Thiago Pessoa                       #}
{# Carrossel 3D Infinito com Foto Central em Ênfase e Links para Páginas            #}
{# ============================================================================== #}

<section class="tp-home-experiences-section" aria-label="Experiências e serviços exclusivos">
  <div class="tp-home-exp-container">
    
    {# Cabeçalho da Seção #}
    <div class="tp-home-exp-header">
      <h2 class="tp-home-exp-title">{{ settings.carousel_exp_title | default('Experiências e serviços exclusivos') }}</h2>
      <p class="tp-home-exp-subtitle">{{ settings.carousel_exp_subtitle | default('Clique e conheça as experiências e exclusividades Thiago Pessoa.') }}</p>
    </div>

    {# Carrossel 3D de 5 Experiências #}
    <div class="tp-exp-carousel-wrapper" id="tpExpCarousel">
      <div class="tp-exp-track">
        
        {# Slide 1: Experiência Ressignificação de joias #}
        <div class="tp-exp-slide" data-index="0">
          <a href="{{ settings.carousel_exp_01_url | default('/ressignificacao') }}" class="tp-exp-card" title="Experiência Ressignificação de joias">
            <img 
              src="{{ 'carousel_exp_01.jpg' | has_custom_image ? ('carousel_exp_01.jpg' | static_url) : 'https://images.unsplash.com/photo-1531995811006-35cb42e1a022?w=900&q=80' }}" 
              alt="Experiência Ressignificação de joias - Thiago Pessoa" 
              loading="lazy" 
            />
            <div class="tp-exp-overlay">
              <span class="tp-exp-label">{{ settings.carousel_exp_01_title | default('Experiência Ressignificação de joias') }}</span>
            </div>
          </a>
        </div>

        {# Slide 2: Experiência O Primeiro Sim #}
        <div class="tp-exp-slide" data-index="1">
          <a href="{{ settings.carousel_exp_02_url | default('/primeiro-sim') }}" class="tp-exp-card" title="Experiência O Primeiro Sim">
            <img 
              src="{{ 'carousel_exp_02.jpg' | has_custom_image ? ('carousel_exp_02.jpg' | static_url) : 'https://images.unsplash.com/photo-1603561591411-07134e71a2a9?w=900&q=80' }}" 
              alt="Experiência O Primeiro Sim - Thiago Pessoa" 
              loading="lazy" 
            />
            <div class="tp-exp-overlay">
              <span class="tp-exp-label">{{ settings.carousel_exp_02_title | default('Experiência O Primeiro Sim') }}</span>
            </div>
          </a>
        </div>

        {# Slide 3: Seja Ourives de Suas Alianças #}
        <div class="tp-exp-slide" data-index="2">
          <a href="{{ settings.carousel_exp_03_url | default('/seja-ourives-de-suas-aliancas') }}" class="tp-exp-card" title="Seja Ourives de Suas Alianças">
            <img 
              src="{{ 'carousel_exp_03.jpg' | has_custom_image ? ('carousel_exp_03.jpg' | static_url) : 'https://images.unsplash.com/photo-1515562141207-7a88fb7ce338?w=900&q=80' }}" 
              alt="Seja Ourives de Suas Alianças - Thiago Pessoa" 
              loading="lazy" 
            />
            <div class="tp-exp-overlay">
              <span class="tp-exp-label">{{ settings.carousel_exp_03_title | default('Seja Ourives de Suas Alianças') }}</span>
            </div>
          </a>
        </div>

        {# Slide 4: Joias Exclusivas e Personalizadas #}
        <div class="tp-exp-slide" data-index="3">
          <a href="{{ settings.carousel_exp_04_url | default('/joias-exclusivas-e-personalizadas') }}" class="tp-exp-card" title="Joias Exclusivas e Personalizadas">
            <img 
              src="{{ 'carousel_exp_04.jpg' | has_custom_image ? ('carousel_exp_04.jpg' | static_url) : 'https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?w=900&q=80' }}" 
              alt="Joias Exclusivas e Personalizadas - Thiago Pessoa" 
              loading="lazy" 
            />
            <div class="tp-exp-overlay">
              <span class="tp-exp-label">{{ settings.carousel_exp_04_title | default('Joias Exclusivas e Personalizadas') }}</span>
            </div>
          </a>
        </div>

        {# Slide 5: Ateliê Thiago Pessoa #}
        <div class="tp-exp-slide" data-index="4">
          <a href="{{ settings.carousel_exp_05_url | default('/contato') }}" class="tp-exp-card" title="Ateliê Thiago Pessoa">
            <img 
              src="{{ 'carousel_exp_05.jpg' | has_custom_image ? ('carousel_exp_05.jpg' | static_url) : 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?w=900&q=80' }}" 
              alt="Ateliê & Alta Joalheria - Thiago Pessoa" 
              loading="lazy" 
            />
            <div class="tp-exp-overlay">
              <span class="tp-exp-label">{{ settings.carousel_exp_05_title | default('Ateliê Thiago Pessoa') }}</span>
            </div>
          </a>
        </div>

      </div>

      {# Setas de Navegação #}
      <button type="button" class="tp-exp-nav-btn tp-exp-prev" aria-label="Slide anterior" onclick="tpRotateHomeExp(-1)">&#10094;</button>
      <button type="button" class="tp-exp-nav-btn tp-exp-next" aria-label="Próximo slide" onclick="tpRotateHomeExp(1)">&#10095;</button>

      {# Indicadores (Dots) #}
      <div class="tp-exp-dots">
        <button type="button" class="tp-exp-dot is-active" aria-label="Ir para slide 1" onclick="tpGoToHomeExp(0)"></button>
        <button type="button" class="tp-exp-dot" aria-label="Ir para slide 2" onclick="tpGoToHomeExp(1)"></button>
        <button type="button" class="tp-exp-dot" aria-label="Ir para slide 3" onclick="tpGoToHomeExp(2)"></button>
        <button type="button" class="tp-exp-dot" aria-label="Ir para slide 4" onclick="tpGoToHomeExp(3)"></button>
        <button type="button" class="tp-exp-dot" aria-label="Ir para slide 5" onclick="tpGoToHomeExp(4)"></button>
      </div>

    </div>
  </div>
</section>

{# Estilos CSS Isolados e Otimizados para Alta Performance #}
<style>
.tp-home-experiences-section {
  width: 100% !important;
  max-width: 100% !important;
  padding: 60px 0 70px 0 !important;
  background-color: #ffffff !important;
  overflow: hidden !important;
  box-sizing: border-box !important;
  clear: both !important;
}

.tp-home-exp-container {
  width: 100% !important;
  max-width: 1300px !important;
  margin: 0 auto !important;
  padding: 0 20px !important;
  box-sizing: border-box !important;
}

.tp-home-exp-header {
  text-align: center !important;
  margin-bottom: 40px !important;
}

.tp-home-exp-title {
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
  font-size: 32px !important;
  font-weight: 700 !important;
  color: #111111 !important;
  letter-spacing: -0.02em !important;
  margin: 0 0 12px 0 !important;
  line-height: 1.25 !important;
}

.tp-home-exp-subtitle {
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
  font-size: 16px !important;
  font-weight: 400 !important;
  color: #444444 !important;
  margin: 0 auto !important;
  max-width: 650px !important;
  line-height: 1.5 !important;
}

/* Estrutura do Carrossel 3D */
.tp-exp-carousel-wrapper {
  position: relative !important;
  width: 100% !important;
  max-width: 1100px !important;
  height: 380px !important;
  margin: 0 auto !important;
  overflow: hidden !important;
  user-select: none !important;
}

.tp-exp-track {
  position: relative !important;
  width: 100% !important;
  height: 100% !important;
}

.tp-exp-slide {
  position: absolute !important;
  top: 50% !important;
  left: 50% !important;
  width: 270px !important;
  height: 330px !important;
  box-sizing: border-box !important;
  transition: transform 0.6s cubic-bezier(0.25, 1, 0.5, 1),
              left 0.6s cubic-bezier(0.25, 1, 0.5, 1),
              opacity 0.6s ease,
              box-shadow 0.6s ease,
              filter 0.6s ease !important;
  will-change: transform, left, opacity !important;
}

.tp-exp-card {
  position: relative !important;
  display: block !important;
  width: 100% !important;
  height: 100% !important;
  border-radius: 14px !important;
  overflow: hidden !important;
  text-decoration: none !important;
  background-color: #1a1a1a !important;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15) !important;
}

.tp-exp-card img {
  width: 100% !important;
  height: 100% !important;
  object-fit: cover !important;
  display: block !important;
  border: none !important;
  transition: transform 0.6s ease !important;
}

.tp-exp-card:hover img {
  transform: scale(1.04) !important;
}

/* Gradiente escuro no rodapé para o texto ficar sempre nítido */
.tp-exp-overlay {
  position: absolute !important;
  bottom: 0 !important;
  left: 0 !important;
  right: 0 !important;
  padding: 40px 18px 20px 18px !important;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.9) 0%, rgba(0, 0, 0, 0.6) 50%, rgba(0, 0, 0, 0) 100%) !important;
  box-sizing: border-box !important;
  pointer-events: none !important;
}

.tp-exp-label {
  display: block !important;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
  font-size: 15px !important;
  font-weight: 700 !important;
  color: #ffffff !important;
  line-height: 1.35 !important;
  text-align: center !important;
  text-shadow: 0 2px 6px rgba(0, 0, 0, 0.7) !important;
}

/* Posições de profundidade 3D (Coverflow) */
/* 1. Centro (Ativo com Ênfase) */
.tp-exp-slide.pos-center {
  left: 50% !important;
  transform: translate(-50%, -50%) scale(1.18) !important;
  z-index: 10 !important;
  opacity: 1 !important;
  filter: blur(0px) !important;
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.35) !important;
  pointer-events: auto !important;
}

/* 2. Lateral Direita (Próximo) */
.tp-exp-slide.pos-next {
  left: calc(50% + 220px) !important;
  transform: translate(-50%, -50%) scale(0.85) !important;
  z-index: 5 !important;
  opacity: 0.68 !important;
  filter: brightness(0.92) !important;
  pointer-events: auto !important;
}

/* 3. Lateral Esquerda (Anterior) */
.tp-exp-slide.pos-prev {
  left: calc(50% - 220px) !important;
  transform: translate(-50%, -50%) scale(0.85) !important;
  z-index: 5 !important;
  opacity: 0.68 !important;
  filter: brightness(0.92) !important;
  pointer-events: auto !important;
}

/* 4. Oculto à Direita */
.tp-exp-slide.pos-far-next {
  left: calc(50% + 380px) !important;
  transform: translate(-50%, -50%) scale(0.65) !important;
  z-index: 1 !important;
  opacity: 0 !important;
  pointer-events: none !important;
}

/* 5. Oculto à Esquerda */
.tp-exp-slide.pos-far-prev {
  left: calc(50% - 380px) !important;
  transform: translate(-50%, -50%) scale(0.65) !important;
  z-index: 1 !important;
  opacity: 0 !important;
  pointer-events: none !important;
}

/* Botões de Navegação */
.tp-exp-nav-btn {
  position: absolute !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  z-index: 25 !important;
  width: 42px !important;
  height: 42px !important;
  border-radius: 50% !important;
  background: rgba(255, 255, 255, 0.95) !important;
  border: 1px solid #e2e8f0 !important;
  color: #1a1a1a !important;
  font-size: 20px !important;
  font-weight: bold !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  cursor: pointer !important;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15) !important;
  transition: all 0.25s ease !important;
  line-height: 1 !important;
  padding: 0 !important;
}

.tp-exp-nav-btn:hover {
  background: #dfc995 !important;
  border-color: #dfc995 !important;
  color: #ffffff !important;
  transform: translateY(-50%) scale(1.1) !important;
}

.tp-exp-prev { left: 16px !important; }
.tp-exp-next { right: 16px !important; }

/* Indicadores de Bolinhas (Dots) */
.tp-exp-dots {
  position: absolute !important;
  bottom: 8px !important;
  left: 0 !important;
  right: 0 !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  gap: 8px !important;
  z-index: 25 !important;
}

.tp-exp-dot {
  width: 8px !important;
  height: 8px !important;
  border-radius: 50% !important;
  background: #cbd5e1 !important;
  border: none !important;
  cursor: pointer !important;
  transition: all 0.3s ease !important;
  padding: 0 !important;
}

.tp-exp-dot.is-active {
  width: 26px !important;
  border-radius: 6px !important;
  background: #dfc995 !important;
}

/* Responsividade Mobile (Smartphones) */
@media (max-width: 768px) {
  .tp-home-exp-title {
    font-size: 24px !important;
  }
  .tp-home-exp-subtitle {
    font-size: 14px !important;
  }
  .tp-exp-carousel-wrapper {
    height: 310px !important;
  }
  .tp-exp-slide {
    width: 200px !important;
    height: 250px !important;
  }
  .tp-exp-slide.pos-center {
    transform: translate(-50%, -50%) scale(1.12) !important;
  }
  .tp-exp-slide.pos-next {
    left: calc(50% + 140px) !important;
    transform: translate(-50%, -50%) scale(0.8) !important;
    opacity: 0.6 !important;
  }
  .tp-exp-slide.pos-prev {
    left: calc(50% - 140px) !important;
    transform: translate(-50%, -50%) scale(0.8) !important;
    opacity: 0.6 !important;
  }
  .tp-exp-label {
    font-size: 13px !important;
  }
  .tp-exp-nav-btn {
    width: 36px !important;
    height: 36px !important;
    font-size: 16px !important;
  }
  .tp-exp-prev { left: 4px !important; }
  .tp-exp-next { right: 4px !important; }
}
</style>

{# Script de Rotação Interativa e Infinita #}
<script>
(function() {
  var currentIndex = 0;
  var totalSlides = 5;
  var autoPlayTimer = null;
  var isPaused = false;

  function updateSlidePositions() {
    var slides = document.querySelectorAll('.tp-exp-slide');
    var dots = document.querySelectorAll('.tp-exp-dot');
    if (!slides.length) return;

    for (var i = 0; i < totalSlides; i++) {
      var slide = slides[i];
      var diff = (i - currentIndex + totalSlides) % totalSlides;
      
      slide.classList.remove('pos-center', 'pos-next', 'pos-prev', 'pos-far-next', 'pos-far-prev');
      
      if (diff === 0) {
        slide.classList.add('pos-center');
      } else if (diff === 1) {
        slide.classList.add('pos-next');
      } else if (diff === totalSlides - 1) {
        slide.classList.add('pos-prev');
      } else if (diff === 2) {
        slide.classList.add('pos-far-next');
      } else {
        slide.classList.add('pos-far-prev');
      }
    }

    if (dots.length) {
      dots.forEach(function(dot, idx) {
        if (idx === currentIndex) {
          dot.classList.add('is-active');
        } else {
          dot.classList.remove('is-active');
        }
      });
    }
  }

  window.tpRotateHomeExp = function(direction) {
    currentIndex = (currentIndex + direction + totalSlides) % totalSlides;
    updateSlidePositions();
    restartTimer();
  };

  window.tpGoToHomeExp = function(index) {
    currentIndex = index;
    updateSlidePositions();
    restartTimer();
  };

  function startTimer() {
    if (autoPlayTimer) clearInterval(autoPlayTimer);
    autoPlayTimer = setInterval(function() {
      if (!isPaused) {
        currentIndex = (currentIndex + 1) % totalSlides;
        updateSlidePositions();
      }
    }, 4000);
  }

  function restartTimer() {
    startTimer();
  }

  // Inicializa quando o DOM estiver pronto
  document.addEventListener('DOMContentLoaded', function() {
    updateSlidePositions();
    startTimer();

    var carousel = document.getElementById('tpExpCarousel');
    if (carousel) {
      carousel.addEventListener('mouseenter', function() { isPaused = true; });
      carousel.addEventListener('mouseleave', function() { isPaused = false; });
      carousel.addEventListener('touchstart', function() { isPaused = true; }, { passive: true });
      carousel.addEventListener('touchend', function() { isPaused = false; });
    }
  });

  // Também roda imediatamente caso o evento DOMContentLoaded já tenha passado
  updateSlidePositions();
  startTimer();
})();
</script>