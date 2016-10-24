
$(document).on('mouseenter', 'div.product-thumb', function () {
    $(this).css("border", "1px solid #ddd");
    $(this).find(".button-group").show('fast');
});
$(document).on('mouseleave', 'div.product-thumb', function () {
    $(this).css("border", "0px solid #ddd");
    $(this).find(".button-group").hide('fast');
});
$('.lazy').css({
    'height': $('.lazy').height()
});



$(window).load(function () {
    
    if(localStorage.getItem('newsRegister') !== "true") {
    $('#memberModal').modal('show');
}

$(document).on('click', '#cookieAccept', function () {
    localStorage.setItem("cookieAccept", "true");
    $('#cookieConsent').hide('slow');
});
$(document).on('click', '#cookieCancel', function () {
    $('#cookieConsent').hide('slow');
});
if (localStorage.getItem("cookieAccept") !== "true") {
    $('#cookieConsent').show('slow');
}

});

$(document).on('click', '.img-thumbnail', function () {
    var newsrc = $(this).attr('src').replace('cache/', '').replace('-50x50', '').replace(/ /g, '%20');
    $('.thumbnail-display').html('<img src=' + newsrc + ' />');
});








