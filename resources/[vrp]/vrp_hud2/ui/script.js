$(document).ready(function(){
  var $debug = $("#debug");
  var $heal = $("#heal");
  var $box = $("#box");
  var $boxArmor = $("#armor");
  $(".GaugeMeter").gaugeMeter();
  window.addEventListener('message', function(event){
     if ( event.data.display == true ) {
      $('#hud').fadeIn();
    }   
    else {
      $('#hud').fadeOut();
    }
    if ( event.data.incar == true ) {
      $('.hud-player').css('background','url(img/barra_Esquerda.png) no-repeat');
      $('.hud-player').css('width','300px');
      $('.hud-player').css('right','240px');
      $('#voz').css('left','-85px');
      $("#velocimetro").fadeIn(4000);
      $("#barraDireita").fadeIn(2000);
    }   
    else {
      $('#voz').css('left','0px'); 
      $(".hud-player").css('width', '226px');
      $('.hud-player').css('background','url(img/hud.png) no-repeat');
      // $('.hud-player').css('margin-right','5px');
      $('.hud-player').css('right','15px');
      $("#velocimetro").fadeOut(10);
      $("#barraDireita").fadeOut(10);
    }
    if ( event.data.cinto == true ) {
      $('.cinto-icon').css('display', 'none');      
    }   
    else {
      $('.cinto-icon').css('display', 'block');
    }
    if ( event.data.farol == 0 ) {
      $('.farol-icon').css('opacity', '0.2');   
      $('.farol-icon').css('background-image', 'url(img/farolApagado.png)');   
    }   
     if ( event.data.farol == 1 ) {
      $('.farol-icon').css('opacity', '1');   
      $('.farol-icon').css('background-image', 'url(img/farolBaixo.png)');   
    }   
    if ( event.data.farol == 2 ) {
      $('.farol-icon').css('opacity', '1');   
      $('.farol-icon').css('background-image', 'url(img/farolAlto.png)');   
    }   
    if ( event.data.cruise == true ) {
      $('#cruise').css('opacity', '1');   
    }
    else{
      $('#cruise').css('opacity', '0.2');  
    }   
    if ( event.data.piscaEsquerdo == true && event.data.piscaDireito == false) {
      $('#setas').removeClass('active');
      $('#setaEsquerda').addClass('setaPiscandoEsquerda');
      $('#setaEsquerda').removeClass('setaEsquerda');
      $('#setaEsquerda').addClass('active');
    } 
    if ( event.data.piscaEsquerdo == false) {
      $('#setas').removeClass('active');
      $('#setaEsquerda').removeClass('setaPiscandoEsquerda');
      $('#setaEsquerda').removeClass('active');
      $('#setaEsquerda').addClass('setaEsquerda');
    } 
    if ( event.data.piscaDireito == true &&  event.data.piscaEsquerdo == false ) {
      $('#setaDireita').removeClass('setaDireita');
      $('#setas').removeClass('active');
      $('#setaDireita').addClass('setaPiscandoDireita');
      $('#setaDireita').addClass('active');

    } 
    if ( event.data.piscaDireito == false) {
      $('#setas').removeClass('active');
      $('#setaDireita').removeClass('active');
      $('#setaDireita').removeClass('setaPiscandoDireita');
      $('#setaDireita').addClass('setaDireita');
    } 
    if ( event.data.piscaDireito == true && event.data.piscaEsquerdo == true ) {
      $('#setaDireita').removeClass('setaDireita');
      $('#setaEsquerda').removeClass('setaEsquerda');
      $('#setaDireita').removeClass('active');
      $('#setaEsquerda').removeClass('active');
      $('#setaEsquerda').addClass('setaPiscandoEsquerda');
      $('#setaDireita').addClass('setaPiscandoDireita');
      $('#setas').addClass('active');
    }     
    $("#rpm").gaugeMeter({percent:event.data.rpm*100});
    $("#gas").gaugeMeter({percent:event.data.gas});
    // $("#gas").gaugeMeter({percent: 10});
    $("#rua").html(event.data.rua);
    $("#kmph").html('<span class="velocidade">'+event.data.speed+'</span></br><span class="km"><b>KMPH</b></span>');
    $("#dados").html(event.data.dia+' de '+event.data.mes+' - '+event.data.hora+':'+event.data.minuto);
    $("#gearTexto").html(event.data.gear);
    $("#vozTexto").html(event.data.voz);
    $boxArmor.css("width", (event.data.armor)+"%");
    $heal.css("width", (event.data.heal)+"%");
    if ( event.data.gas > 20 ) {
      $('.gasDiv').css('background-image','url(img/gasolina0.png)');
      $('.gasDiv').removeClass('gasReserva');
      $('#gas').removeClass('gasReserva');
    }   
    else {
      $('.gasDiv').css('background-image','url(img/gasolina.png)');
      $('.gasDiv').addClass('gasReserva');
      $('#gas').addClass('gasReserva');
    }      
  }); 


});

