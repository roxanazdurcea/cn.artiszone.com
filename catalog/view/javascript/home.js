/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    rox();
    $(window).resize(rox);
});

function rox() {
    var H = $('.imgH img').height();
    $('.boxH').height(H);
}