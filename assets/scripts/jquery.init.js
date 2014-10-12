$(document).ready(function() {
  
  // Skills
  $('.frontpage article.clickable').click(function() {
    $(this).find('aside').slideToggle('slow');
  });
  
  // CMS
  $('.frontpage #cms article h3').click(function() {
    $(this).next('aside').slideToggle('slow');
  });
});

