window.addEventListener("load", function(){

  
  if (document.getElementById("header--nav_icon")) {
    document.getElementById("header--nav_icon").addEventListener("click", function(){
      
      var mobileNav = document.getElementById("mobile_nav");
      
      if (mobileNav.style.display == "none") { 
        mobileNav.style.display = "block";
      } else {
        mobileNav.style.display = "none";
      }
      
      mobileNav.classList.toggle("mobile_menu_is_shown");
      mobileNav.classList.toggle("is_mobile_nav_shown");
    });
  };
});