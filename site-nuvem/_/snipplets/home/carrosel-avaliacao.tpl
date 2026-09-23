{# ================================================================= #}
{# NUVEMSHOP TPL SNIPPLET: snipplets/carrosel-avaliacao.tpl          #}
{# Carrossel 3D de 4 Imagens de Avaliações (Thiago Pessoa)           #}
{# 100% EDITÁVEL PELO PAINEL DA NUVEMSHOP (CONFIG/SETTINGS.TXT)     #}
{# ================================================================= #}

{% set rev_enable = true %}
{% if settings.reviews_carousel_enable is defined %}
  {% set rev_enable = settings.reviews_carousel_enable %}
{% endif %}

{% if rev_enable %}
  {# 1. Textos e Links do Painel Nuvemshop #}
  {% set rev_title = settings.reviews_carousel_title | default('Confira nossas avaliações:') %}
  {% set rev_rating_note = settings.reviews_carousel_rating_note | default('Avaliação totalizada Google 5.0 de 5, com base em 278 avaliações') %}
  {% set rev_btn_text = settings.reviews_carousel_button_text | default('CLIQUE E AGENDE AQUI A SUA EXPERIÊNCIA!') %}
  {% set rev_btn_url = settings.reviews_carousel_button_url | default('https://wa.me/5511915904835?text=Ol%C3%A1!%20Gostaria%20de%20agendar%20a%20minha%20experi%C3%AAncia%20com%20o%20Thiago%20Pessoa.') %}

  {# 2. 4 Fotos das Avaliações (com fallback seguro sem operador ternário para nunca quebrar) #}
  {% if "reviews_carousel_01.jpg" | has_custom_image %}
    {% set rev_img_1 = "reviews_carousel_01.jpg" | static_url %}
  {% else %}
    {% set rev_img_1 = "https://thiagopessoa.com/wp-content/uploads/2025/02/capa-1-scaled.jpeg" %}
  {% endif %}

  {% if "reviews_carousel_02.jpg" | has_custom_image %}
    {% set rev_img_2 = "reviews_carousel_02.jpg" | static_url %}
  {% else %}
    {% set rev_img_2 = "https://thiagopessoa.com/wp-content/uploads/2025/02/IMG_7379-scaled.jpg" %}
  {% endif %}

  {% if "reviews_carousel_03.jpg" | has_custom_image %}
    {% set rev_img_3 = "reviews_carousel_03.jpg" | static_url %}
  {% else %}
    {% set rev_img_3 = "https://thiagopessoa.com/wp-content/uploads/2025/02/IMG_3701-scaled.jpeg" %}
  {% endif %}

  {% if "reviews_carousel_04.jpg" | has_custom_image %}
    {% set rev_img_4 = "reviews_carousel_04.jpg" | static_url %}
  {% else %}
    {% set rev_img_4 = "https://thiagopessoa.com/wp-content/uploads/2025/02/IMG_3947-scaled.jpg" %}
  {% endif %}

<style>
/* ==========================================================
   CARROSSEL 3D DE 4 FOTOS DE AVALIAÇÕES (THIAGO PESSOA)
   Layout: Título -> 4 Fotos 3D -> Texto de Avaliação -> Botão CTA
   ========================================================== */

.tp-reviews-3d-wrapper {
  position: relative !important;
  width: 100% !important;
  max-width: 1200px !important;
  margin: 60px auto !important;
  padding: 0 16px 40px !important;
  text-align: center !important;
  box-sizing: border-box !important;
  overflow: hidden !important;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
}

/* 1. Título no Começo */
.tp-reviews-3d-wrapper .tp-reviews-title {
  font-family: Montserrat, sans-serif !important;
  font-size: 26px !important;
  font-weight: 700 !important;
  color: #111111 !important;
  letter-spacing: -0.3px !important;
  margin: 0 auto 36px !important;
  line-height: 1.3 !important;
  text-align: center !important;
}

@media (min-width: 768px) {
  .tp-reviews-3d-wrapper .tp-reviews-title {
    font-size: 32px !important;
    margin-bottom: 44px !important;
  }
}

/* 2. Palco 3D do Carrossel com as 4 Fotos */
.tp-reviews-stage-container {
  position: relative !important;
  width: 100% !important;
  max-width: 960px !important;
  margin: 0 auto !important;
  perspective: 1200px !important;
  padding: 20px 0 30px !important;
  box-sizing: border-box !important;
}

.tp-reviews-track {
  position: relative !important;
  width: 100% !important;
  height: 440px !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  transform-style: preserve-3d !important;
}

/* Cards das 4 Imagens */
.tp-reviews-card {
  position: absolute !important;
  width: 320px !important;
  max-width: 82vw !important;
  height: 420px !important;
  border-radius: 16px !important;
  overflow: hidden !important;
  background: #ffffff !important;
  box-shadow: 0 10px 28px rgba(0, 0, 0, 0.12), 0 1px 4px rgba(0, 0, 0, 0.06) !important;
  border: 1px solid rgba(0, 0, 0, 0.08) !important;
  transition: transform 0.65s cubic-bezier(0.25, 1, 0.5, 1), opacity 0.65s ease, filter 0.65s ease, box-shadow 0.65s ease !important;
  cursor: pointer !important;
  user-select: none !important;
  will-change: transform, opacity !important;
}

.tp-reviews-card img {
  width: 100% !important;
  height: 100% !important;
  object-fit: cover !important;
  display: block !important;
  pointer-events: none !important;
}

/* Posições 3D dos 4 Cards */
.tp-reviews-card.active {
  transform: translateX(0) translateZ(80px) scale(1.05) !important;
  z-index: 10 !important;
  opacity: 1 !important;
  filter: none !important;
  box-shadow: 0 20px 45px -8px rgba(0, 0, 0, 0.26), 0 0 0 1px rgba(196, 157, 84, 0.35) !important;
}

.tp-reviews-card.next {
  transform: translateX(250px) translateZ(-60px) rotateY(-16deg) scale(0.88) !important;
  z-index: 5 !important;
  opacity: 0.75 !important;
  filter: brightness(0.92) !important;
}

.tp-reviews-card.prev {
  transform: translateX(-250px) translateZ(-60px) rotateY(16deg) scale(0.88) !important;
  z-index: 5 !important;
  opacity: 0.75 !important;
  filter: brightness(0.92) !important;
}

.tp-reviews-card.far {
  transform: translateX(0) translateZ(-160px) scale(0.74) !important;
  z-index: 1 !important;
  opacity: 0.2 !important;
  pointer-events: none !important;
}

/* Mobile: Ajuste de escala e translação */
@media (max-width: 640px) {
  .tp-reviews-track {
    height: 380px !important;
  }
  .tp-reviews-card {
    width: 260px !important;
    height: 360px !important;
  }
  .tp-reviews-card.active {
    transform: translateX(0) translateZ(50px) scale(1.03) !important;
  }
  .tp-reviews-card.next {
    transform: translateX(140px) translateZ(-40px) rotateY(-14deg) scale(0.84) !important;
  }
  .tp-reviews-card.prev {
    transform: translateX(-140px) translateZ(-40px) rotateY(14deg) scale(0.84) !important;
  }
}

/* Setas de Navegação */
.tp-rev-nav-btn {
  position: absolute !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  width: 44px !important;
  height: 44px !important;
  border-radius: 50% !important;
  background: rgba(255, 255, 255, 0.92) !important;
  border: 1px solid rgba(0, 0, 0, 0.1) !important;
  color: #111111 !important;
  font-size: 18px !important;
  font-weight: bold !important;
  display: flex !important;
  align-items: center !important;
  justify-content: center !important;
  cursor: pointer !important;
  z-index: 15 !important;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.12) !important;
  transition: all 0.25s ease !important;
  outline: none !important;
}

.tp-rev-nav-btn:hover {
  background: #c49d54 !important;
  color: #ffffff !important;
  transform: translateY(-50%) scale(1.08) !important;
  box-shadow: 0 6px 18px rgba(196, 157, 84, 0.4) !important;
}

.tp-rev-prev { left: 8px !important; }
.tp-rev-next { right: 8px !important; }

@media (min-width: 768px) {
  .tp-rev-prev { left: -12px !important; }
  .tp-rev-next { right: -12px !important; }
}

/* Indicadores de Pontos */
.tp-rev-dots {
  display: flex !important;
  justify-content: center !important;
  align-items: center !important;
  gap: 8px !important;
  margin-top: 22px !important;
  z-index: 12 !important;
  position: relative !important;
}

.tp-rev-dot {
  width: 10px !important;
  height: 10px !important;
  border-radius: 50% !important;
  background: #dddddd !important;
  border: none !important;
  padding: 0 !important;
  cursor: pointer !important;
  transition: all 0.3s ease !important;
}

.tp-rev-dot.active {
  width: 28px !important;
  border-radius: 6px !important;
  background: #c49d54 !important;
}

/* 3. Texto Logo Abaixo do Carrossel */
.tp-reviews-3d-wrapper .tp-reviews-rating-note {
  font-family: Montserrat, sans-serif !important;
  font-size: 14px !important;
  font-weight: 500 !important;
  color: #444444 !important;
  margin: 32px auto 20px !important;
  line-height: 1.5 !important;
  max-width: 600px !important;
  text-align: center !important;
}

@media (min-width: 768px) {
  .tp-reviews-3d-wrapper .tp-reviews-rating-note {
    font-size: 16px !important;
    margin-top: 36px !important;
  }
}

/* 4. Botão de Agendamento Logo Abaixo */
.tp-reviews-3d-wrapper .tp-reviews-cta-wrap {
  margin: 14px auto 0 !important;
  text-align: center !important;
}

.tp-reviews-3d-wrapper .tp-reviews-cta-btn {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  background-color: #cfad76 !important;
  color: #111111 !important;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
  font-size: 15px !important;
  font-weight: 700 !important;
  text-transform: none !important;
  letter-spacing: -0.01em !important;
  padding: 16px 36px !important;
  border-radius: 9px !important;
  text-decoration: none !important;
  box-shadow: 0 6px 18px rgba(0, 0, 0, 0.09) !important;
  transition: all 0.3s cubic-bezier(0.25, 1, 0.5, 1) !important;
  box-sizing: border-box !important;
  border: none !important;
}

.tp-reviews-3d-wrapper .tp-reviews-cta-btn:hover {
  background-color: #bd9a62 !important;
  color: #0a0a0a !important;
  transform: translateY(-2px) !important;
  box-shadow: 0 10px 24px rgba(0, 0, 0, 0.14) !important;
}

@media (min-width: 768px) {
  .tp-reviews-3d-wrapper .tp-reviews-cta-btn {
    font-size: 16px !important;
    padding: 17px 42px !important;
  }
}

</style>

<div class="tp-reviews-3d-wrapper" id="tpReviews3d">
  
  {# 1. TÍTULO NO COMEÇO #}
  {% if rev_title and rev_title is not empty %}
    <h2 class="tp-reviews-title">{{ rev_title }}</h2>
  {% endif %}

  {# 2. CARROSSEL 3D DE 4 FOTOS #}
  <div class="tp-reviews-stage-container" id="tpReviewsStage">
    <div class="tp-reviews-track" id="tpReviewsTrack">
      <div class="tp-reviews-card active" data-index="0">
        <img src="{{ rev_img_1 }}" alt="Avaliação 1 - Thiago Pessoa" loading="lazy" />
      </div>
      <div class="tp-reviews-card next" data-index="1">
        <img src="{{ rev_img_2 }}" alt="Avaliação 2 - Thiago Pessoa" loading="lazy" />
      </div>
      <div class="tp-reviews-card far" data-index="2">
        <img src="{{ rev_img_3 }}" alt="Avaliação 3 - Thiago Pessoa" loading="lazy" />
      </div>
      <div class="tp-reviews-card prev" data-index="3">
        <img src="{{ rev_img_4 }}" alt="Avaliação 4 - Thiago Pessoa" loading="lazy" />
      </div>
    </div>

    <!-- Setas de Navegação -->
    <button type="button" class="tp-rev-nav-btn tp-rev-prev" id="tpRevPrevBtn" aria-label="Avaliação anterior">&#10094;</button>
    <button type="button" class="tp-rev-nav-btn tp-rev-next" id="tpRevNextBtn" aria-label="Próxima avaliação">&#10095;</button>

    <!-- Indicadores de Pontos -->
    <div class="tp-rev-dots" id="tpRevDots">
      <button type="button" class="tp-rev-dot active" data-index="0" aria-label="Foto 1"></button>
      <button type="button" class="tp-rev-dot" data-index="1" aria-label="Foto 2"></button>
      <button type="button" class="tp-rev-dot" data-index="2" aria-label="Foto 3"></button>
      <button type="button" class="tp-rev-dot" data-index="3" aria-label="Foto 4"></button>
    </div>
  </div>

  {# 3. TEXTO LOGO ABAIXO DO CARROSSEL #}
  {% if rev_rating_note and rev_rating_note is not empty %}
    <p class="tp-reviews-rating-note">{{ rev_rating_note }}</p>
  {% endif %}

  {# 4. BOTÃO ABAIXO (CTA) #}
  {% if rev_btn_text and rev_btn_text is not empty %}
    <div class="tp-reviews-cta-wrap">
      <a href="{{ rev_btn_url }}" class="tp-reviews-cta-btn" target="_blank" rel="noopener noreferrer">
        {{ rev_btn_text }}
      </a>
    </div>
  {% endif %}

</div>

<script>
(function() {
  function initTpReviews3d() {
    var track = document.getElementById('tpReviewsTrack');
    if (!track) return;
    var cards = track.querySelectorAll('.tp-reviews-card');
    if (cards.length === 0) return;

    var dots = document.querySelectorAll('#tpRevDots .tp-rev-dot');
    var prevBtn = document.getElementById('tpRevPrevBtn');
    var nextBtn = document.getElementById('tpRevNextBtn');
    var stage = document.getElementById('tpReviewsStage');

    var currentIdx = 0;
    var total = cards.length;
    var autoTimer = null;

    function render3D() {
      for (var i = 0; i < total; i++) {
        var card = cards[i];
        card.classList.remove('active', 'next', 'prev', 'far');
        var diff = (i - currentIdx + total) % total;
        if (diff === 0) {
          card.classList.add('active');
        } else if (diff === 1) {
          card.classList.add('next');
        } else if (diff === total - 1) {
          card.classList.add('prev');
        } else {
          card.classList.add('far');
        }
      }

      dots.forEach(function(dot, idx) {
        if (idx === currentIdx) {
          dot.classList.add('active');
        } else {
          dot.classList.remove('active');
        }
      });
    }

    function goTo(idx) {
      currentIdx = (idx + total) % total;
      render3D();
    }

    function next() {
      goTo(currentIdx + 1);
    }

    function prev() {
      goTo(currentIdx - 1);
    }

    function startAuto() {
      stopAuto();
      autoTimer = setInterval(next, 3800);
    }

    function stopAuto() {
      if (autoTimer) {
        clearInterval(autoTimer);
        autoTimer = null;
      }
    }

    if (nextBtn) {
      nextBtn.addEventListener('click', function(e) {
        e.preventDefault();
        next();
        startAuto();
      });
    }

    if (prevBtn) {
      prevBtn.addEventListener('click', function(e) {
        e.preventDefault();
        prev();
        startAuto();
      });
    }

    dots.forEach(function(dot, idx) {
      dot.addEventListener('click', function(e) {
        e.preventDefault();
        goTo(idx);
        startAuto();
      });
    });

    cards.forEach(function(card, idx) {
      card.addEventListener('click', function() {
        if (!card.classList.contains('active')) {
          goTo(idx);
          startAuto();
        }
      });
    });

    if (stage) {
      stage.addEventListener('mouseenter', stopAuto);
      stage.addEventListener('mouseleave', startAuto);

      var touchStartX = 0;
      stage.addEventListener('touchstart', function(e) {
        touchStartX = e.changedTouches[0].screenX;
        stopAuto();
      }, { passive: true });

      stage.addEventListener('touchend', function(e) {
        var touchEndX = e.changedTouches[0].screenX;
        if (touchStartX - touchEndX > 45) {
          next();
        } else if (touchEndX - touchStartX > 45) {
          prev();
        }
        startAuto();
      }, { passive: true });
    }

    render3D();
    startAuto();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initTpReviews3d);
  } else {
    initTpReviews3d();
  }
})();
</script>
{% endif %}