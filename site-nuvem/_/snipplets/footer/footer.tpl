{# ============================================================================== #}
{# SNIPPLET: snipplets/footer/footer.tpl                                            #}
{# Rodapé Thiago Pessoa - Alta Joalheria                                            #}
{# Barra Superior de Selos com Ícones Nítidos + 3 Colunas + 4 Redes Sociais         #}
{# ============================================================================== #}

{{ component('nubesdk-slot', { type: "before_footer" }) }}

<footer class="tp-main-footer" data-store="footer">

  {# ===================================================================== #}
  {# 1. BARRA SUPERIOR DE BENEFÍCIOS (5 SELOS COM ÍCONES VISÍVEIS)        #}
  {# ===================================================================== #}
  <div class="tp-footer-benefits-bar">
    <div class="tp-footer-container">
      <div class="tp-benefits-grid">
        
        {# 1. Compra 100% segura (Escudo com Check) #}
        <div class="tp-benefit-item">
          <span class="tp-benefit-icon-wrapper">
            <svg class="tp-benefit-svg" viewBox="0 0 24 24" fill="none" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
              <path d="M9 12l2 2 4-4"/>
            </svg>
          </span>
          <span class="tp-benefit-text">Compra 100% segura</span>
        </div>

        {# 2. Envios nacionais e internacionais (Caminhão) #}
        <div class="tp-benefit-item">
          <span class="tp-benefit-icon-wrapper">
            <svg class="tp-benefit-svg" viewBox="0 0 24 24" fill="none" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <rect x="1" y="3" width="15" height="13"/>
              <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/>
              <circle cx="5.5" cy="18.5" r="2.5"/>
              <circle cx="18.5" cy="18.5" r="2.5"/>
            </svg>
          </span>
          <span class="tp-benefit-text">Envios nacionais e internacionais</span>
        </div>

        {# 3. Atendimento personalizado (Balão de Chat) #}
        <div class="tp-benefit-item">
          <span class="tp-benefit-icon-wrapper">
            <svg class="tp-benefit-svg" viewBox="0 0 24 24" fill="none" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/>
            </svg>
          </span>
          <span class="tp-benefit-text">Atendimento personalizado</span>
        </div>

        {# 4. Frete grátis (Caixa de Entrega) #}
        <div class="tp-benefit-item">
          <span class="tp-benefit-icon-wrapper">
            <svg class="tp-benefit-svg" viewBox="0 0 24 24" fill="none" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <line x1="16.5" y1="9.4" x2="7.5" y2="4.21"/>
              <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
              <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
              <line x1="12" y1="22.08" x2="12" y2="12"/>
            </svg>
          </span>
          <span class="tp-benefit-text">Frete grátis</span>
        </div>

        {# 5. Joias exclusivas e personalizadas (Diamante / Joia) #}
        <div class="tp-benefit-item">
          <span class="tp-benefit-icon-wrapper">
            <svg class="tp-benefit-svg" viewBox="0 0 24 24" fill="none" stroke="#111111" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M6 3h12l4 6-10 12L2 9z"/>
              <path d="M11 3L8 9l4 11 4-11-3-6"/>
              <path d="M2 9h20"/>
            </svg>
          </span>
          <span class="tp-benefit-text">Joias exclusivas e personalizadas</span>
        </div>

      </div>
    </div>
  </div>

  {# ===================================================================== #}
  {# 2. CORPO PRINCIPAL DO RODAPÉ (FUNDO PRETO - 3 COLUNAS)               #}
  {# ===================================================================== #}
  <div class="tp-footer-main">
    <div class="tp-footer-container">
      <div class="tp-footer-columns">

        {# Coluna 1: Logo #}
        <div class="tp-footer-col tp-footer-col-logo">
          <a href="{{ store.url }}" class="tp-footer-logo-link" title="{{ store.name }}">
            {% if "footer_logo.png" | has_custom_image %}
              <img src="{{ 'footer_logo.png' | static_url }}" alt="{{ store.name }}" class="tp-footer-logo-img" />
            {% elseif "logo.png" | has_custom_image %}
              <img src="{{ 'logo.png' | static_url }}" alt="{{ store.name }}" class="tp-footer-logo-img tp-logo-invert" />
            {% else %}
              <div class="tp-footer-logo-text">
                <span class="tp-logo-brand">Thiago Pessoa</span>
                <span class="tp-logo-sub">ourivesaria e design de alianças e joias</span>
              </div>
            {% endif %}
          </a>
        </div>

        {# Coluna 2: NOSSOS CONTATOS + REDES SOCIAIS (Apenas Face, Insta, YouTube, TikTok) #}
        <div class="tp-footer-col tp-footer-col-contacts">
          <h3 class="tp-footer-heading">NOSSOS CONTATOS</h3>
          
          <ul class="tp-contact-list">
            {# Endereço #}
            <li class="tp-contact-item">
              <span class="tp-contact-icon">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <polygon points="3 11 22 2 13 21 11 13 3 11"/>
                </svg>
              </span>
              <div class="tp-contact-info">
                <strong>Escritório:</strong> Av Brig. Faria Lima, 1811 - 11º Andar, Conj 1125 - Jardim Paulista, SP - 01452-001
              </div>
            </li>

            {# E-mail #}
            <li class="tp-contact-item">
              <span class="tp-contact-icon">
                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                  <polyline points="22,6 12,13 2,6"/>
                </svg>
              </span>
              <div class="tp-contact-info">
                <a href="mailto:atendimento@thiagopessoa.com">atendimento@thiagopessoa.com</a>
              </div>
            </li>
          </ul>

          {# Redes Sociais: Exclusivamente Facebook, Instagram, YouTube e TikTok #}
          <div class="tp-footer-social-row">
            {# Facebook #}
            <a href="{{ store.facebook | default('https://facebook.com') }}" target="_blank" rel="noopener noreferrer" class="tp-social-link" title="Facebook" aria-label="Facebook">
              <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                <path d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 4.84 3.44 8.87 8 9.8V15H8v-3h2V9.5C10 7.57 11.57 6 13.5 6H16v3h-2c-.55 0-1 .45-1 1v2h3v3h-3v6.95C18.05 21.45 22 17.19 22 12z"/>
              </svg>
            </a>

            {# Instagram #}
            <a href="{{ store.instagram | default('https://instagram.com/thiagopessoajoias') }}" target="_blank" rel="noopener noreferrer" class="tp-social-link" title="Instagram" aria-label="Instagram">
              <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
              </svg>
            </a>

            {# YouTube #}
            <a href="{{ store.youtube | default('https://youtube.com') }}" target="_blank" rel="noopener noreferrer" class="tp-social-link" title="YouTube" aria-label="YouTube">
              <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
              </svg>
            </a>

            {# TikTok #}
            <a href="{{ store.tiktok | default('https://tiktok.com/@thiagopessoajoias') }}" target="_blank" rel="noopener noreferrer" class="tp-social-link" title="TikTok" aria-label="TikTok">
              <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
                <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64c.298-.002.595.042.88.13V9.4a6.33 6.33 0 0 0-1-.08A6.34 6.34 0 0 0 3 15.66a6.34 6.34 0 0 0 10.82 4.5 6.27 6.27 0 0 0 1.88-4.49V8.65a8.28 8.28 0 0 0 4.89 1.59V6.8a4.85 4.85 0 0 1-1-.11z"/>
              </svg>
            </a>
          </div>
        </div>

        {# Coluna 3: INFORMAÇÕES #}
        <div class="tp-footer-col tp-footer-col-links">
          <h3 class="tp-footer-heading">INFORMAÇÕES</h3>
          <ul class="tp-info-list">
            <li><a href="/garantia-das-joias" class="tp-info-link">Garantia das joias</a></li>
            <li><a href="/politica-de-privacidade" class="tp-info-link">Política de privacidade</a></li>
          </ul>
        </div>

      </div>
    </div>
  </div>

  {# ===================================================================== #}
  {# 3. RODAPÉ DE COPYRIGHT CENTRALIZADO                                    #}
  {# ===================================================================== #}
  <div class="tp-footer-copyright">
    <div class="tp-footer-container">
      <p class="tp-copy-text">
        &copy; Copyright {{ "now" | date('Y') }} | Thiago Pessoa | Todos os direitos reservados
      </p>
      {# Crédito oficial sutil Nuvemshop #}
      <div class="tp-nuvem-credit">
        {{ new_powered_by_link }}
      </div>
    </div>
  </div>

</footer>

{# ===================================================================== #}
{# ESTILOS CSS REFORÇADOS (Garante visibilidade contra resets do tema)    #}
{# ===================================================================== #}
<style>
/* Base do Rodapé */
.tp-main-footer {
  width: 100% !important;
  background-color: #000000 !important;
  color: #ffffff !important;
  font-family: Montserrat, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif !important;
  clear: both !important;
  margin: 0 !important;
  padding: 0 !important;
  box-sizing: border-box !important;
}

.tp-footer-container {
  width: 100% !important;
  max-width: 1300px !important;
  margin: 0 auto !important;
  padding: 0 24px !important;
  box-sizing: border-box !important;
}

/* 1. Barra Superior de Benefícios */
.tp-footer-benefits-bar {
  width: 100% !important;
  background-color: #ffffff !important;
  border-top: 1px solid #e5e5e5 !important;
  border-bottom: 1px solid #e5e5e5 !important;
  padding: 18px 0 !important;
}

.tp-benefits-grid {
  display: flex !important;
  align-items: center !important;
  justify-content: space-between !important;
  flex-wrap: wrap !important;
}

.tp-benefit-item {
  display: inline-flex !important;
  align-items: center !important;
  gap: 12px !important;
  color: #111111 !important;
  padding: 6px 14px !important;
  position: relative !important;
}

.tp-benefit-item:not(:last-child)::after {
  content: "" !important;
  position: absolute !important;
  right: 0 !important;
  top: 50% !important;
  transform: translateY(-50%) !important;
  height: 20px !important;
  width: 1px !important;
  background-color: #e0e0e0 !important;
}

/* Ícones da Barra Superior (Blindados para sempre aparecerem) */
.tp-benefit-icon-wrapper {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 22px !important;
  height: 22px !important;
  min-width: 22px !important;
  min-height: 22px !important;
  flex-shrink: 0 !important;
}

.tp-benefit-svg {
  display: block !important;
  width: 22px !important;
  height: 22px !important;
  min-width: 22px !important;
  min-height: 22px !important;
  visibility: visible !important;
  opacity: 1 !important;
}

.tp-benefit-text {
  font-size: 13.5px !important;
  font-weight: 600 !important;
  color: #111111 !important;
  letter-spacing: -0.01em !important;
  white-space: nowrap !important;
}

/* 2. Corpo Principal Preto */
.tp-footer-main {
  padding: 55px 0 45px 0 !important;
}

.tp-footer-columns {
  display: flex !important;
  align-items: flex-start !important;
  justify-content: space-between !important;
  gap: 40px !important;
}

/* Coluna 1: Logo */
.tp-footer-col-logo {
  flex: 0 0 300px !important;
}

.tp-footer-logo-link {
  display: inline-block !important;
  text-decoration: none !important;
}

.tp-footer-logo-img {
  max-width: 250px !important;
  height: auto !important;
  display: block !important;
}

.tp-logo-invert {
  filter: brightness(0) invert(1) !important;
}

.tp-footer-logo-text {
  display: flex !important;
  flex-direction: column !important;
}

.tp-logo-brand {
  font-size: 26px !important;
  font-weight: 700 !important;
  color: #ffffff !important;
  letter-spacing: -0.02em !important;
}

.tp-logo-sub {
  font-size: 11px !important;
  color: #aaaaaa !important;
  margin-top: 4px !important;
  letter-spacing: 0.05em !important;
}

/* Coluna 2: Nossos Contatos */
.tp-footer-col-contacts {
  flex: 1 1 450px !important;
  max-width: 500px !important;
}

/* Coluna 3: Informações */
.tp-footer-col-links {
  flex: 0 0 220px !important;
}

/* Títulos das Colunas */
.tp-footer-heading {
  font-size: 14px !important;
  font-weight: 700 !important;
  color: #ffffff !important;
  letter-spacing: 0.08em !important;
  text-transform: uppercase !important;
  margin: 0 0 20px 0 !important;
  padding: 0 !important;
}

/* Lista de Contatos */
.tp-contact-list {
  list-style: none !important;
  padding: 0 !important;
  margin: 0 0 24px 0 !important;
}

.tp-contact-item {
  display: flex !important;
  align-items: flex-start !important;
  gap: 12px !important;
  margin-bottom: 14px !important;
  font-size: 13.5px !important;
  line-height: 1.5 !important;
  color: #cccccc !important;
}

.tp-contact-icon {
  flex-shrink: 0 !important;
  margin-top: 3px !important;
  display: inline-flex !important;
}

.tp-contact-info strong {
  color: #ffffff !important;
  font-weight: 700 !important;
}

.tp-contact-info a {
  color: #cccccc !important;
  text-decoration: none !important;
  transition: color 0.2s ease !important;
}

.tp-contact-info a:hover {
  color: #cfad76 !important;
}

/* Redes Sociais: 4 Ícones Alinhados */
.tp-footer-social-row {
  display: flex !important;
  align-items: center !important;
  gap: 18px !important;
  margin-top: 20px !important;
}

.tp-social-link {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  color: #ffffff !important;
  text-decoration: none !important;
  transition: all 0.25s ease !important;
  opacity: 0.9 !important;
}

.tp-social-link svg {
  display: block !important;
  width: 20px !important;
  height: 20px !important;
}

.tp-social-link:hover {
  color: #cfad76 !important;
  transform: translateY(-2px) !important;
  opacity: 1 !important;
}

/* Links de Informações */
.tp-info-list {
  list-style: none !important;
  padding: 0 !important;
  margin: 0 !important;
}

.tp-info-list li {
  margin-bottom: 12px !important;
}

.tp-info-link {
  font-size: 13.5px !important;
  color: #cccccc !important;
  text-decoration: none !important;
  transition: color 0.2s ease !important;
}

.tp-info-link:hover {
  color: #cfad76 !important;
}

/* 3. Copyright Inferior */
.tp-footer-copyright {
  border-top: 1px solid #1a1a1a !important;
  padding: 22px 0 !important;
  text-align: center !important;
}

.tp-copy-text {
  font-size: 12px !important;
  color: #888888 !important;
  margin: 0 !important;
  letter-spacing: 0.02em !important;
}

.tp-nuvem-credit {
  margin-top: 8px !important;
  font-size: 11px !important;
  opacity: 0.5 !important;
}

.tp-nuvem-credit a {
  color: #888888 !important;
}

/* Responsividade Mobile */
@media (max-width: 991px) {
  .tp-benefits-grid {
    justify-content: center !important;
    gap: 14px !important;
  }
  .tp-benefit-item:not(:last-child)::after {
    display: none !important;
  }
  .tp-footer-columns {
    flex-direction: column !important;
    gap: 36px !important;
  }
  .tp-footer-col-logo,
  .tp-footer-col-contacts,
  .tp-footer-col-links {
    flex: 1 1 100% !important;
    max-width: 100% !important;
  }
}
</style>