$(function() {
    console.log("main js loaded");

 ////////////////////////// CALENDAR DATE PICKER POP UP /////////////////////////
    
    $(".datepicker").datepicker({dateFormat: "yy-mm-dd"});


    ////////////////////////// DRAG A TRIP TO TRASH CAN /////////////////////////

    $(".stack").draggable();
    $('#trash').droppable({
        drop: function(event, ui) {
            var answer = confirm("Are you sure you want to permanently delete this trip?");
            if (answer) {
                $.ajax({
                    url: '/trips',
                    data: {
                        id: ui.draggable.attr('data-id')
                    },
                    'method': 'delete'
                });
                ui.draggable.hide(500);
                setTimeout(function() {
                    ui.draggable.remove();
                    countTrips();
                }, 500);
            } //end of if statement
        }
    });


    //////////////////////////////// SCROLL WEATHER //////////////////////////////////

    if ($('#results').length) {
        $('#results').slick({
            infinite: true,
            arrows: true,
            slidesToShow: 5,
            slidesToScroll: 1
        });
    }


    ////////////////////////////// COUNT TRIPS /////////////////////////////////////
    function countTrips() {
        var tripCount = $(".trips_container div#tripLi").length;
        $('#count-trips').empty();
        $('#count-trips').append(tripCount);
    }
    countTrips();



    ///////////////// TOGGLE BUTTON TO SHOW AND HIDE DEFAULT ITEMS////////////////
    $("#catButtons button").click(function() {
        $("#catButtons button").siblings().removeClass('highlight');
        $(this).addClass('highlight');
        $("#allCategories").css('display', 'block');
        // $(this).toggleClass('highlight');
        var category = $(this).html();
        console.log(category);
        $("#allCategories").children().fadeOut();
        $("#allCategories").children().each(function() {
            if ($(this).hasClass(category)) {
                $(this).fadeIn();
            }
        });

    });


    function createCustomToPack(text) {
        var markup = '<li class="ui-state-default"><div class="checkbox"><label><input type="checkbox" value="" id="item" />' + text + '</label><button class="remove-item btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-remove"></span></button></div></li>';
        $('#customSortable').prepend(markup);
        $('.add-toPack').val('');
    }


    ////////////////////////////////////// SELECT TILES and CHOOSE ACTIVITIES //////////////////////////

    $(".all_thumbs .thumbnail").click(function() {
        console.log(this);
        $(this).toggleClass('highlight');
        if($(this).css('opacity') == 1){
            $(this).animate({opacity:0.5}, 1000);
        } else{
            $(this).animate({opacity:1}, 1000);
        }
    });



 ////////////////////////// CHOOSING ACTIVITIES /////////////////////////

    // $(".activity_image").click(function(){
    //     console.log(this);
    //     if($(this).css('opacity') == 1){
    //         $(this).animate({opacity:0.3}, 1000);
    //     } else{
    //         $(this).animate({opacity:1}, 1000);
    //     }
    // });

    /////////////////////////////////// PLACES AUTOCOMPLETE ////////////////////

    $(".location").autocomplete({
        autoFocus: true,
        source: function(request, response) {
            $.ajax({
                url: "//gd.geobytes.com/AutoCompleteCity",
                dataType: "jsonp",
                data: {
                    q: request.term
                },
                success: function(data) {
                    console.log(data)
                    if (data == "") {
                        $('.flash').delay(300).fadeIn('normal', function() {
                            $(this).delay(2500).fadeOut('normal');
                        });
                    } else {
                        console.log("found")
                    }
                    response(data);
                }
            });
        },
        minLength: 3
    });


    //////////////////////////////////////// To PACK ////////////////////////////
    // countTodos();
    // all packed btn
    $("#checkAll").click(function() {
        AllDone();
    });
    //create an item
    $('.add-toPack').on('keypress', function(e) {
        e.preventDefault;
        if (e.which == 13) {
            if ($(this).val() != '') {
                var todo = $(this).val();
                createCustomToPack(todo);
                countTodos();
            } else {
                // some validation
            }
        }
    });
    // mark item as packed

    $('.toPacklist').on('change', '#sortable li input[type="checkbox"]', '#checkIcon', function() {
        if ($(this).prop('checked')) {
            var doneItem = $(this).parent().parent().find('label').text();
            $(this).parent().parent().parent().addClass('remove');
            done(doneItem);
            countTodos();
        }
    });
    //delete item from "already packed"
    $('.toPacklist').on('click', '.remove-item', function() {

        removeItem(this);
    });
    // count how many items left to pack
    function countTodos() {
        var count = $("#sortable li").length;
        $('.count-todos').html(count);
    }
    //create your own item
    function createTodo(text) {
        var markup = '<li class="ui-state-default"><div class="checkbox"><label><input type="checkbox" value="" id="item" checked />' + text + '</label><button class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-arrow-right"></span></button><button class="remove-item btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-remove"></span></button></div></li>';
        $('#sortable').prepend(markup);
        $('.add-toPack').val('');
    }
    //mark item as packed
    function done(doneItem) {

        var done = doneItem;
        var markup = '<li><input type="checkbox" checked>' + done + '</button><button class="btn btn-default btn-xs pull-right remove-item"><span class="glyphicon glyphicon-remove"></span></button><button class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-arrow-left"></span></button></li>';
        $('#done-items').prepend(markup);
        $('.remove').remove();
    }
    //mark all tasks as done
    function AllDone() {
        var myArray = [];
        $('#sortable li').each(function() {
            myArray.push($(this).text());
        });
        // mark all as packed
        for (i = 0; i < myArray.length; i++) {
            $('#done-items').append('<li><input type="checkbox" checked>' + myArray[i] + '<button class="btn btn-default btn-xs pull-right  remove-item"><span class="glyphicon glyphicon-remove"></span></button><button class="btn btn-default btn-xs pull-right"><span class="glyphicon glyphicon-arrow-left"></span></button></li>');
        }
        // myArray
        $('#sortable li').remove();
        countTodos();
    }
    //remove packed item from list
    function removeItem(element) {
        // debugger;
        $(element).parent().remove();
    }
    ////////////////////END OF TO PACK /////////////////


    if ($('#map-canvas').length) {
        // google maps
        function initialize() {
            var latlong = [];
            var query = $("#query").text().split(', ');
            var city = query.shift();
            var state = query.shift();
            var country = query.shift();
            var results;
            var geocoder = new google.maps.Geocoder();
            var location = city;


            var lat_result;
            var long_result;

            geocoder.geocode({
                'address': location
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    lat_result = results[0].geometry.location.lat();
                    console.log(lat_result);
                    long_result = results[0].geometry.location.lng();
                    console.log(long_result);
                    latlong = lat_result + ", " + long_result;
                    weather(lat_result, long_result);
                } else {
                    alert("Something got wrong " + status);
                }

            });

            var mapOptions = {
                zoom: 7,
                styles: [{
                    "featureType": "road",
                    "elementType": "geometry",
                    "stylers": [{
                        "lightness": 100
                    }, {
                        "visibility": "simplified"
                    }]
                }, {
                    "featureType": "water",
                    "elementType": "all",
                    "stylers": [{
                        "color": "#39CCCC"
                    }]
                }],

                center: new google.maps.LatLng(-34.397, 150.644)
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
        }


        function loadScript() {
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.src = '//maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyD-7NSPt2Gzjn79uQ-NoKl7xGKc0oO4H54&sensor=false&callback=initialize';
            document.body.appendChild(script);
        }

        window.onload = loadScript();


        function weather(lat_result, long_result) {
            var lat_result = lat_result;
            var long_result = long_result;
            var query = $("#query").text().split(', ');

            var city = query.shift();
            var country = query.shift();

            $(".heading").append(city);

            $.ajax({
                url: "//api.wunderground.com/api/c391db3a2a98fb5a/forecast10day/q/" + lat_result + "," + long_result + ".json",
                dataType: "jsonp",
                success: function(data) {
                    for (var i = 0; i < data.forecast.txt_forecast.forecastday.length; i++) {
                        var day = data.forecast.txt_forecast.forecastday[i].title;
                        var new_day = day.toUpperCase()
                        var weatherResult = data.forecast.txt_forecast.forecastday[i].fcttext;
                        var icon = data.forecast.txt_forecast.forecastday[i].icon_url;
                        var today = new Date();
                        var dd = today.getDate();

                        $(".day" + i).append("<span> " + new_day + "<img src=" + icon + " style='float:right'></span><div style='clear:both'><h6 style='width: 100%; display:block; height: 100px'> " + weatherResult + "</h6></div>");
                    }
                }
            });
        }
        window.initialize = initialize;
    }

}); //end of ready function