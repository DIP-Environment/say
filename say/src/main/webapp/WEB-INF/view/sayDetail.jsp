<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html style="font-size: 16px;">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Comment">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>say_detail</title>
    <link rel="stylesheet" href="css/nicepage.css" media="screen">
<link rel="stylesheet" href="css/say_detail.css" media="screen">
    <script class="u-script" type="text/javascript" src="js/jquery-1.9.1.min.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 3.23.8, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/envLogo.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="say_detail">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body"><header class="u-clearfix u-header u-header" id="sec-c967"><div class="u-clearfix u-sheet u-sheet-1">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px; font-weight: 700; text-transform: uppercase;">
            <a class="u-button-style u-custom-active-border-color u-custom-border u-custom-border-color u-custom-borders u-custom-hover-border-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg><use xlink:href="#menu-hamburger"></use></svg>
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;"><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</symbol>
</defs></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-nav u-spacing-30 u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" href="say_list.html" style="padding: 10px 0px;">Say</a>
</li><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" href="tip.html" style="padding: 10px 0px;">Tip</a>
</li><li class="u-nav-item"><a class="u-border-2 u-border-active-palette-1-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-button-style u-nav-link u-text-active-palette-1-base u-text-grey-90 u-text-hover-grey-90" style="padding: 10px 0px;">Talk</a>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="say_list.html" style="padding: 10px 0px;">Say</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="tip.html" style="padding: 10px 0px;">Tip</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" style="padding: 10px 0px;">Talk</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
        <a href="https://nicepage.com" class="u-image u-logo u-image-1" data-image-width="200" data-image-height="94">
          <img src="images/envLogo.png" class="u-logo-image u-logo-image-1">
        </a><span class="u-icon u-icon-circle u-text-palette-1-base u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 128 128" style=""><use xlink:href="#svg-4049"></use></svg><svg class="u-svg-content" viewBox="0 0 128 128" id="svg-4049"><path d="m64 17.43a46.754 46.754 0 0 0 -27.4 84.638l.043.03.008.006a46.775 46.775 0 0 0 54.692 0l.046-.032a46.754 46.754 0 0 0 -27.389-84.642zm-24.62 82.305v-3.025a22.766 22.766 0 0 1 22.77-22.78h1.735.115s.076 0 .115 0h1.735a22.766 22.766 0 0 1 22.77 22.78v3.025a43.233 43.233 0 0 1 -49.24 0zm24.735-29.3h-.23a15.518 15.518 0 0 1 -15.454-15.5c0-.4.017-.806.051-1.214a15.571 15.571 0 0 1 31.037.012c.033.4.05.8.05 1.2a15.518 15.518 0 0 1 -15.454 15.5zm28.005 26.586v-.311a26.261 26.261 0 0 0 -18.82-25.199 18.966 18.966 0 0 0 9.766-16.58c0-.5-.021-1-.062-1.484a19.07 19.07 0 0 0 -38.013-.012c-.042.491-.063.994-.063 1.5a18.959 18.959 0 0 0 9.772 16.576 26.26 26.26 0 0 0 -18.82 25.199v.311a43.25 43.25 0 1 1 56.24 0z"></path></svg></span>
      </div></header>
    <section class="u-align-center u-clearfix u-image u-shading u-section-1" src="" data-image-width="1280" data-image-height="851" id="sec-e4b2">
      <div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-1">DE​TAIL</h3>
        <h4 class="u-text u-text-default u-text-2">Home &gt; Say &gt; Detail</h4>
      </div>
    </section>
    <section class="u-clearfix u-section-2" id="sec-aec7">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="fr-view u-align-center u-clearfix u-rich-text u-text u-text-1">
       <!--  title -->
          <h1 style="text-align: center;"><c:out value=" ${articleData.article.title }"/></h1>
          <p style="text-align: center;">
            <br>
          </p>
          <!-- content -->
          <p style="text-align: center;">
            <span style="line-height: 2.0;"><u:pre value="${articleData.content }"/></span>
          </p>
        </div>
  		<!-- date -->
        <p class="u-align-right u-text u-text-2">${articleData.article.regDate }</p>
		<c:if test="${authUser.id == articleData.article.writer.id }">
			<a href="articleModify.do?no=${articleData.article.number }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">수정</a>
			<a href="articleDelete.do?no=${articleData.article.number }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">삭제</a>
		</c:if>
		<c:set var="pageNo" value="${empty param.pageNo ? '1': param.pageNo }"/>
		<a href="articleList.do?pageNo=${pageNo }" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">목록</a>
        <!-- <a href="https://nicepage.com/c/architecture-building-website-templates" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">삭제</a>
        <a href="https://nicepage.com/c/architecture-building-website-templates" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-2">수정</a> -->
      </div>
    </section>
    <section class="u-align-center u-border-2 u-border-palette-3-base u-clearfix u-palette-3-light-3 u-section-3" id="sec-13f6">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-subtitle u-text u-text-default u-text-1">Comm<span style="font-weight: 700;"></span>ent
        </h2>
        <div class="u-form u-form-1">
          <form action="#" method="POST" class="u-clearfix u-form-spacing-15 u-form-vertical u-inner-form" style="padding: 15px;" source="email" name="form">
            <input type="hidden" id="siteId" name="siteId" value="618634">
            <input type="hidden" id="pageId" name="pageId" value="623010">
            <div class="u-form-group u-form-message u-form-group-1">
              <label for="message-6797" class="u-form-control-hidden u-label">Address</label>
              <textarea placeholder="Enter your message" rows="4" cols="50" id="message-6797" name="message" class="u-border-1 u-border-grey-30 u-input u-input-rectangle" required=""></textarea>
            </div>
            <div class="u-align-right u-form-group u-form-submit u-form-group-2">
              <a href="#" class="u-btn u-btn-submit u-button-style">등록</a>
              <input type="submit" value="submit" class="u-form-control-hidden">
            </div>
            <div class="u-form-send-message u-form-send-success">Thank you! Your message has been sent.</div>
            <div class="u-form-send-error u-form-send-message">Unable to send your message. Please fix errors then try again.</div>
            <input type="hidden" value="" name="recaptchaResponse">
          </form>
        </div>
      </div>
    </section>
    <section class="u-clearfix u-palette-3-light-3 u-section-4" id="sec-9954">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h3 class="u-text u-text-1">작성자이름</h3>
        <p class="u-text u-text-2">2021.08.01 am 10:00</p>
        <p class="u-text u-text-3">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim 
veniam, quis nostrud exercitation <a href="" class="u-border-2 u-border-black u-border-hover-palette-1-base u-btn u-button-style u-none u-text-body-color u-btn-1">ullamco laboris</a> nisi ut aliquip ex ea 
commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
occaecat cupidatat non proident, sunt in culpa qui officia deserunt 
mollit anim id est laborum. 
        </p>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-4164"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Sample text. Click to select the text box. Click again or double click to start editing the text.</p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/css-templates" target="_blank">
        <span>CSS Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.com/html-website-builder" target="_blank">
        <span>HTML Builder</span>
      </a>. 
    </section>
  </body>
</html>