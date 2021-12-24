<!DOCTYPE html>
<html>
<head>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>dashboard</title>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <style type="text/css">
    <%@ include file="../Demo/dashboard_style.css"%>
  </style>
</head>
<body>

<div class="grid-container">
   <div class="menu-icon">
    <i class="fas fa-bars header__menu"></i>
  </div>
   
  <header class="header" style="display:inline-flex; width: 700px;">
    <div class="header__search">Search...</div>
    <div class="header__avatar">Welcome</div>
  </header>

  <aside class="sidenav">
    <div class="sidenav__close-icon">
      <i class="fas fa-times sidenav__brand-close"></i>
    </div>
    <ul class="sidenav__list">
      <li class="sidenav__list-item" id="link10"><a href="dashboard.jsp">Home</a></li>
      <li class="sidenav__list-item" id="link10"><a href="#">About Us</a></li>
      <li class="sidenav__list-item" id="link10"><a href="profile.jsp">View Profile</a></li>
      <li class="sidenav__list-item" id="link10"><a href="logout.jsp">Logout</a></li>
    </ul>
    </aside>
      <footer class="footer" style="display:flex; width: 100%;">
    <div class="footer__copyright">&copy; 2021 UmaSaiteja13</div>
    <div class="footer__signature">Follow me on linkedin</div>
  </footer>
  
   <%@ include file="../Demo/index.html"%>
   </div>
<script type="text/javascript">
  const menuIconEl = $('.menu-icon');
const sidenavEl = $('.sidenav');
const sidenavCloseEl = $('.sidenav__close-icon');

// Add and remove provided class names
function toggleClassName(el, className) {
  if (el.hasClass(className)) {
    el.removeClass(className);
  } else {
    el.addClass(className);
  }
}

// Open the side nav on click
menuIconEl.on('click', function() {
  toggleClassName(sidenavEl, 'active');
});

// Close the side nav on click
sidenavCloseEl.on('click', function() {
  toggleClassName(sidenavEl, 'active');
});
</script>
 
</body>
</html>