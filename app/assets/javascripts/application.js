// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

// require turbolinks
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.turbolinks
//= require twitter/bootstrap
//= require_tree .


 // $(function() {
  // $(".currency").selectBoxIt();
  	// populate: function() {

// $.getJSON("//openexchangerates.org/currencies.json", function (data) {
//     console.log(data);
//      $.each(data, function (index, item) {
//          $('.currency').append(
//               $('<option></option>').val(index).html(item)
//           );
//      });
//  });
// }


 	// $(".currency_result").remove()

 $(".convert").click(function() {

$.getJSON(
    // NB: using Open Exchange Rates here, but you can use any source!
    '//openexchangerates.org/api/latest.json?app_id=94dd428fd2fc46f1accbd2f404239e83', function(data) {
    // Check money.js has finished loading:
    console.log(data.rates)
    if (typeof fx !== "undefined" && fx.rates) {
        fx.rates = data.rates;
        fx.base = data.base;
    } else {
        // If not, apply to fxSetup global:
        var fxSetup = {
            rates: data.rates,
            base: data.base
        };
    }
    // YOUR CODE HERE

from_currency = $( "#from_currency option:selected" ).val();
from_currency_text =  $( "#from_currency option:selected" ).text();
console.log(from_currency);

my_base=from_currency;
amount = $(".amount").val();
console.log(amount);

// set currency to convert to
to_currency_text = $( "#to_currency option:selected" ).text();
my_destination = $( "#to_currency option:selected" ).val();
console.log(my_destination);

// base amount to convert





converted_amount=(amount/data.rates[my_base])*data.rates[my_destination];
new_amount = Math.floor(converted_amount * 100) / 100;
result_text = amount + " " + from_currency_text + " &#8776 " + new_amount + " " +to_currency_text;

console.log(converted_amount);

$(".currency_result").append('<h3></h3>').html(result_text);


      }); //end of json ajax
});
// });