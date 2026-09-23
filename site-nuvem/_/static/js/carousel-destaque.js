/**
 * ARQUIVO: static/js/carousel-destaque.js
 * Lógica do Carrossel 3D para Nuvemshop
 * Suporta: Gestos Touch/Swipe, Autoplay com pausa no hover, cliques nas laterais e dots.
 */

(function initNuvemshopCarousel() {
  function setup() {
    var root = document.getElementById('nsCarousel');
    if (!root) return;

    var slides = [].slice.call(root.querySelectorAll('.ns-slide'));
    var dotsEl = document.getElementById('nsDots');
    var total = slides.length;
    if (total === 0) return;

    var index = 0;
    var timer = null;

    // Configurações lidas do HTML (ou padrões)
    var isAutoplay = root.getAttribute('data-autoplay') !== 'false';
    var interval = parseInt(root.getAttribute('data-interval'), 10) || 4500;

    // Limpa dots existentes para evitar duplicação em navegação SPA
    if (dotsEl) {
      dotsEl.innerHTML = '';
      slides.forEach(function (_, i) {
        var b = document.createElement('button');
        b.className = 'ns-dot';
        b.setAttribute('type', 'button');
        b.setAttribute('aria-label', 'Ir para slide ' + (i + 1));
        b.addEventListener('click', function () {
          go(i);
        });
        dotsEl.appendChild(b);
      });
    }

    var dots = dotsEl ? [].slice.call(dotsEl.children) : [];

    function render() {
      var prev = (index - 1 + total) % total;
      var next = (index + 1) % total;

      slides.forEach(function (s, i) {
        s.className = 'ns-slide';
        if (i === index) {
          s.classList.add('is-active');
        } else if (i === prev) {
          s.classList.add('is-prev');
        } else if (i === next) {
          s.classList.add('is-next');
        }
      });

      dots.forEach(function (d, i) {
        d.classList.toggle('is-active', i === index);
      });
    }

    function go(i) {
      index = (i + total) % total;
      render();
      restartAutoplay();
    }

    function nextSlide() {
      go(index + 1);
    }

    function prevSlide() {
      go(index - 1);
    }

    var nextBtn = root.querySelector('#nsNextBtn');
    var prevBtn = root.querySelector('#nsPrevBtn');

    if (nextBtn) nextBtn.addEventListener('click', nextSlide);
    if (prevBtn) prevBtn.addEventListener('click', prevSlide);

    // Clicar no slide lateral esquerdo ou direito avança diretamente para ele
    slides.forEach(function (s, i) {
      s.addEventListener('click', function (e) {
        if (i !== index) {
          e.preventDefault();
          go(i);
        }
      });
    });

    // Autoplay
    function restartAutoplay() {
      if (!isAutoplay || total <= 1) return;
      clearInterval(timer);
      timer = setInterval(nextSlide, interval);
    }

    if (isAutoplay && total > 1) {
      root.addEventListener('mouseenter', function () {
        clearInterval(timer);
      });
      root.addEventListener('mouseleave', restartAutoplay);
    }

    // Suporte a Touch e Swipe em Dispositivos Móveis
    var x0 = null;
    var y0 = null;

    root.addEventListener('touchstart', function (e) {
      x0 = e.touches[0].clientX;
      y0 = e.touches[0].clientY;
    }, { passive: true });

    root.addEventListener('touchend', function (e) {
      if (x0 === null) return;
      var dx = e.changedTouches[0].clientX - x0;
      var dy = e.changedTouches[0].clientY - y0;

      // Garante que é um swipe horizontal predominante e não scroll vertical
      if (Math.abs(dx) > 35 && Math.abs(dx) > Math.abs(dy)) {
        if (dx < 0) {
          nextSlide();
        } else {
          prevSlide();
        }
      }
      x0 = null;
      y0 = null;
    });

    // Teclas de atalho (acessibilidade)
    root.addEventListener('keydown', function (e) {
      if (e.key === 'ArrowRight') nextSlide();
      if (e.key === 'ArrowLeft') prevSlide();
    });

    // Render inicial
    render();
    restartAutoplay();
  }

  // Compatibilidade com carregamento normal e Turbo/Turbolinks da Nuvemshop
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setup);
  } else {
    setup();
  }

  document.addEventListener('page:load', setup);
  document.addEventListener('turbo:load', setup);
})();
