$(function () {
    var MAX_MSG = 10;

    /**
     * validation functions
     */
    function errorPlacement(error, element) {
        // Add the `help-block` class to the error element
        error.addClass("help-block");

        if (element.prop("type") === "checkbox") {
            error.insertAfter(element.parent("label"));
        } else {
            error.insertAfter(element);
        }
    }

    function highlight(element, errorClass, validClass) {
        $(element).parents(".form-group").addClass("has-error").removeClass("has-success");
    }

    function unhighlight(element, errorClass, validClass) {
        $(element).parents(".form-group").addClass("has-success").removeClass("has-error");
    }

    /**
     * end of validation functions
     */
    var $cityInput = $('#city');

    wow = new WOW(
        {})
        .init();

    var homeDatePicker = $('#date');
    if (homeDatePicker.length) {
        homeDatePicker.datepicker({
            weekStart: 1,
            format: 'dd/mm/yyyy'
        });
    }
    if ($cityInput.length) {
        $cityInput.autocomplete({
            valueKey: 'title',
            source: [
                function (q, add) {
                    $.ajax({
                        type: 'GET',
                        url: '/coursefacile/filterCities',
                        data: {city: q},
                        dataType: 'json',
                        cache: false,
                        success: function (data) {
                            add(data);
                        }

                    });
                }
            ]
        }).on('selected.xdsoft', function (e, field) {
            var $cityIdInput = $("#city_id");
            if (!$cityIdInput.length) {
                $cityIdInput = $("<input>", {id: "city_id", "name": "city_id", "type": "hidden"});
                $cityInput.parent().append($cityIdInput);
            }
            $cityIdInput.val(field.id);
        });
    }
    $.validator.methods.email = function (value, element) {
        return this.optional(element) || /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/.test(value);
    }
    var $loginForm = $('.login-form');
    var $formToValidate = $('.form-validation');
    //login form
    if ($loginForm.length) {
        $loginForm.validate({
            rules: {
                login_email: {
                    required: true,
                    email: true
                },
                login_pwd: {
                    required: true,
                    minlength: 8
                },
                agree: "required"
            },
            messages: {
                login_email: {
                    required: "Veuillez saisir votre adresse email",
                    email: "Veuillez sasir une adresse email correcte"
                },
                login_pwd: {
                    required: "Veuillez saisir votre mot de passe",
                    minlength: "Votre mot de passe doit contenir un minimum de 8 caractères"
                }
            },
            errorElement: "em",
            errorPlacement: errorPlacement,
            highlight: highlight,
            unhighlight: unhighlight
        });
    }
    //forms that have .form-validation
    if ($formToValidate.length) {
        $formToValidate.validate({
            rules: {
                first_name: {
                    required: true,
                    email: false
                },
                last_name: {
                    required: true,
                    email: false
                },
                pwd: {
                    required: true,
                    minlength: 8
                },
                confirm_pwd: {
                    required: true,
                    minlength: 8,
                    equalTo: "#pwd"
                },
                email: {
                    required: true,
                    email: true
                },
                agree: "required"
            },
            messages: {
                first_name: "Veuillez saisir votre nom",
                last_name: "Veuillez saisir votre prénom",
                pwd: {
                    required: "Veuillez saisir votre mot de passe",
                    minlength: "Votre mot de passe doit contenir un minimum de 8 caractères"
                },
                confirm_pwd: {
                    required: "Veuillez saisir votre mot de passe",
                    minlength: "Votre mot de passe doit contenir un minimum de 8 caractères",
                    equalTo: "Veuillez resaisir votre mot de passe"
                },
                email: {
                    required: "Veuillez saisir votre adresse email",
                    email: "Veuillez sasir une adresse email correcte"
                }
            },
            errorElement: "em",
            errorPlacement: errorPlacement,
            highlight: highlight,
            unhighlight: unhighlight
        });

    }
    var $contactForm = $('#contact-form');
    if ($contactForm.length) {
        $contactForm.validate({
            rules: {
                name: {
                    required: true,
                },
                tel: {
                    required: true,
                },
                message: {
                    required: true,
                },
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                name: "Veuillez saisir votre nom",
                tel: "Veuillez saisir votre numéro de telephone",
                message: "Veuillez saisir votre message",
                email: {
                    required: "Veuillez saisir votre adresse email",
                    email: "Veuillez sasir une adresse email correcte"
                }
            },
            errorElement: "em",
            errorPlacement: errorPlacement,
            highlight: highlight,
            unhighlight: unhighlight
        });
    }
    //set sidebar height same as container
    $('#sidebar-gauche').css('height', $('#body-dashboard').height());

    var timePicker = $('#timepicker');
    if (timePicker.length) {
        timePicker.datetimepicker({
            format: 'dd/MM/yyyy hh:mm:ss'
        });
    }
    setTimeout(function () {
        var $nextR = $(".table-condensed th.next"), prevR = $(".table-condensed th.prev");
        if ($nextR.length && prevR.length) {
            prevR.html('<i class="glyphicon glyphicon-arrow-left"></i>');
            $nextR.html('<i class="glyphicon glyphicon-arrow-right"></i>');
        }
    }, 600);
    var $publishMission = $('#publish-mission');
    if ($publishMission.length) {

        $publishMission.validate({
            rules: {
                city: {
                    required: true,
                },
                date: {
                    required: true,
                },
                heure: {
                    required: true,
                },
                minute: {
                    required: true,
                },
                supermarche: {
                    required: true,
                },
                remuneration: {
                    required: true,
                },
                description: {
                    required: true,
                }
            },
            messages: {
                city: {
                    required: "Veuillez saisir votre ville",
                },
                date: {
                    required: "Veuillez saisir une date",
                },
                heure: {
                    required: "Veuillez saisir une heure",
                },
                minute: {
                    required: "Veuillez saisir les minutes",
                },
                supermarche: {
                    required: "Veuillez saisir le supermarché",
                },
                remuneration: {
                    required: "Veuillez saisir la renumeration",
                },
                description: {
                    required: "Veuillez saisir une description",
                }

            },
            errorElement: "em",
            errorPlacement: errorPlacement,
            highlight: highlight,
            unhighlight: unhighlight
        });
    }

    var $profile_form = $('#profile-form');
    if ($profile_form.length) {
        $profile_form.validate({
            rules: {
                fname: {
                    required: true
                },
                lname: {
                    required: true
                },
                password: {
                    required: false,
                    minlength: 8
                },
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                password: {
                    minlength: "Votre mot de passe doit contenir un minimum de 8 caractères"
                },
                email: {
                    required: "Veuillez saisir votre adresse email",
                    email: "Veuillez sasir une adresse email correcte"
                },
                fname: "Veuillez saisir votre nom",
                lname: "Veuillez saisir votre prénom"
            },
            errorElement: "em",
            errorPlacement: errorPlacement,
            highlight: highlight,
            unhighlight: unhighlight
        });
        // $.ajax({
        //     method: 'POST',
        //     url: '/coursefacile/confirm-pwd',
        //     data: {confirmationPwd: result},
        //     dataType: 'json',
        //     success: function (data) {
        //         console.log("kaka");
        //         if (data.length && data[0]) {
        //             $('#check-submit').val(data[1]);
        //             $profile_form.submit();
        //         }
        //     }
        // });
        $('#confirm').click(function (e) {
            e.preventDefault();
            var $pwdConfirm = $('#pwd-confirm');
            if ($profile_form.valid()) {
                $.ajax({
                    method: 'POST',
                    url: '/coursefacile/confirm-pwd',
                    data: {confirmationPwd: $pwdConfirm.val()},
                    dataType: 'json',
                    success: function (data) {
                        // console.log("kaka");
                        if (data.length && data[0]) {
                            $('#check-submit').val(data[1]);
                            $profile_form.submit();
                        } else if (!data[0]) {
                            $pwdConfirm.parent().find('.pwd-error').remove();
                            $pwdConfirm.parent().append('<div class="alert alert-danger pwd-error" role="alert">Mot de passe incorrecte</div>');
                        }
                    }
                });

            } else {
                $(window).scrollTop($("em.error:first").offset().top - 200);
            }
        })

    }

    function correctDate(val) {
        return val < 10 ? "0" + val : val;
    }

    var $btnSendMsg = $('#send-message');
    if ($btnSendMsg.length) {
        var $chatHistory = $('.chat-history');
        $chatHistory.data("pag-start", 0);
        $chatHistory.data("pag-end", MAX_MSG);
        var $chatContainer = $('<ul>');
        var chatClient = new WebSocket("ws://" + location.host + "/coursefacile/chat/" + $btnSendMsg.parent().data('sender'));
        $chatHistory.scrollTop($chatHistory.prop("scrollHeight"));
        chatClient.onmessage = function (evt) {

            var msg = JSON.parse(evt.data);
            // console.log(msg);
            var $recepteurMarkup;
            $recepteurMarkup = $('<li>');
            var $recMsgData = $('<div>', {class: 'message-data'});
            var $recMsgDataName = $('<span>', {class: 'message-data-name'});
            var $recIcone = $('<i>', {class: "fa fa-circle online"});
            $recMsgData.append($recIcone);
            $recMsgDataName.html($btnSendMsg.parent().data('receiver-name'));
            var $recMsgDataTime = $('<span>', {class: 'message-data-time'});
            $recMsgDataTime.html(msg.sentDate);
            $recMsgData.append($recMsgDataName);
            $recMsgData.append($recMsgDataTime);
            var $recmessage = $('<div>', {class: 'message my-message'});
            $recmessage.html(msg.message);
            $recepteurMarkup.append($recMsgData);
            $recepteurMarkup.append($recmessage);
            $chatContainer.append($recepteurMarkup);

            var notif = new Audio(prefixPath + "/sound/definite.mp3");
            notif.play();
            $chatHistory.append($chatContainer);
            $chatHistory.scrollTop($chatHistory.prop("scrollHeight"));
        };
        $btnSendMsg.click(function (e) {
            e.preventDefault();
            //initialisation
            var $message = $('#message');
            var message = $message.val();
            var sender = $(this).parent().data('sender');
            var receiver = $(this).parent().data('receiver');
            var today = new Date();
            var fullDate = correctDate(today.getDate()) + "/" + correctDate(today.getMonth() + 1) + "/" + correctDate(today.getFullYear()) + "  " + correctDate(today.getHours()) + ":" + correctDate(today.getMinutes());

            //building chat markup
            var $emetteurMarkup;
            $emetteurMarkup = $('<li>', {class: 'clearfix'});
            var $emMsgData = $('<div>', {class: 'message-data align-right'});
            var $emMsgDataTime = $('<span>', {class: 'message-data-time'});
            $emMsgDataTime.html(fullDate);
            var $emMsgDataName = $('<span>', {class: 'message-data-name'});
            $emMsgDataName.html(' Moi');
            var $iconeMe = $('<i>', {class: "fa fa-circle me"});
            $emMsgData.append($emMsgDataTime);
            $emMsgData.append($emMsgDataName);
            $emMsgData.append($iconeMe);
            $emetteurMarkup.append($emMsgData);
            var $emMessage = $('<div>', {class: 'message other-message float-right'});
            $emMessage.html(message.replace(/\n/g, "<br>"));
            $emetteurMarkup.append($emMessage);
            $chatContainer.append($emetteurMarkup);
            $chatHistory.append($chatContainer);
            $chatHistory.scrollTop($chatHistory.prop("scrollHeight"));
            //building json message
            var messageObject = {
                message: message,
                sender: sender.toString(),
                receiver: receiver.toString(),
                sentDate: fullDate
            };

            var msg = JSON.stringify(messageObject);
            // console.log(msg);
            //send message
            chatClient.send(msg);
            $message.val('');

        });
        var previousScrollHeight;

        $chatHistory.scroll(function () {
            var pos = $chatHistory.scrollTop();
            if (pos == 0) {
                previousScrollHeight = $chatHistory.prop("scrollHeight");
                var $loader = $('.loader');
                $loader.css('width', '100%')
                var $loaderImg = $('<img>', {src: "https://www.ourshopee.com/img/loader.gif"});
                $loaderImg.css({
                    height: "45px",
                    width: "45px",
                    margin: "auto",
                    display: "block"
                });
                $loader.append($loaderImg);
                $chatHistory.prepend($loader);
                var pagStart = (parseInt($chatHistory.data("pag-end")) + 1);
                var pagEnd = (parseInt($chatHistory.data("pag-end")) + MAX_MSG);
                $chatHistory.data("pag-end", pagEnd);
                $.ajax({
                    type: 'post',
                    url: location.href,
                    data: {start: pagStart, end: pagEnd},
                    dataType: 'json',
                    cache: false,
                    success: function (data) {
                        $loader.html("");

                        if (data.length && data[0] !== "error") {
                            var $chatContainer = $('<ul>');
                            var i;
                            for (i = 0; i < data.length; i++) {
                                //emetteur
                                if (data[i].sender == 'moi') {
                                    var $emetteurMarkup;
                                    $emetteurMarkup = $('<li>', {class: 'clearfix'});
                                    var $emMsgData = $('<div>', {class: 'message-data align-right'});
                                    var $emMsgDataTime = $('<span>', {class: 'message-data-time'});
                                    $emMsgDataTime.html(data[i].sentDate);
                                    var $emMsgDataName = $('<span>', {class: 'message-data-name'});
                                    $emMsgDataName.html(' Moi');
                                    var $iconeMe = $('<i>', {class: "fa fa-circle me"});
                                    $emMsgData.append($emMsgDataTime);
                                    $emMsgData.append($emMsgDataName);
                                    $emMsgData.append($iconeMe);
                                    $emetteurMarkup.append($emMsgData);
                                    var $emMessage = $('<div>', {class: 'message other-message float-right'});
                                    $emMessage.html(data[i].message);
                                    $emetteurMarkup.append($emMessage);
                                    $chatContainer.append($emetteurMarkup);
                                } else {
                                    //recepteur

                                    var $recepteurMarkup;
                                    $recepteurMarkup = $('<li>');
                                    var $recMsgData = $('<div>', {class: 'message-data'});
                                    var $recMsgDataName = $('<span>', {class: 'message-data-name'});
                                    var $recIcone = $('<i>', {class: "fa fa-circle online"});
                                    $recMsgData.append($recIcone);
                                    $recMsgDataName.html(data[i].sender);
                                    var $recMsgDataTime = $('<span>', {class: 'message-data-time'});
                                    $recMsgDataTime.html(data[i].sentDate);
                                    $recMsgData.append($recMsgDataName);
                                    $recMsgData.append($recMsgDataTime);
                                    var $recmessage = $('<div>', {class: 'message my-message'});
                                    $recmessage.html(data[i].message);
                                    $recepteurMarkup.append($recMsgData);
                                    $recepteurMarkup.append($recmessage);
                                    $chatContainer.append($recepteurMarkup);
                                }
                                $chatHistory.prepend($chatContainer);
                                $chatHistory.scrollTop($chatHistory.prop("scrollHeight") - previousScrollHeight);
                            }
                        }
                    }
                });
            }
        });

    }
    var $formTime = $('.form_time');
    if ($formTime.length) {
        $formTime.datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 1,
            minView: 0,
            maxView: 1,
            forceParse: 0
        });
        var $formTimeInput = $formTime.find('input');
        $formTimeInput.val($formTimeInput.data('time'));

        var $de = $('#de');
        var $a = $('#a');
        if ($a.length && $de.length) {
            $a.val($a.data('time'));
            $de.val($de.data('time'));
        }

    }
    /**
     * map itinerary
     */
    var $getItinerary = $('#get-itinerary');
    var directionsDisplay;
    var directionsService;
    var travelMode = 'WALKING';

    //var currentPosition;

    function initMap(mapId, mapZoom, currentPosition) {
        map = new google.maps.Map(document.getElementById(mapId), {
            center: currentPosition,
            zoom: mapZoom
        });
        directionsDisplay = new google.maps.DirectionsRenderer;
        directionsService = new google.maps.DirectionsService;
        directionsDisplay.setMap(map);

    }

    function createItinerary(keyWord, currentPosition) {
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
            location: currentPosition,
            // radius: 10000,
            type: ['store'],
            keyword: keyWord,
            rankBy: google.maps.places.RankBy.DISTANCE
        }, function (result, status) {
            nearbySearchCallback(result, status, currentPosition);
        });
    }

    var shopPlace;

    function drawItinirary(position, travel, place, wayPoint) {
        shopPlace = place;
        var directionServiceRoute = {
            origin: position,
            destination: place.geometry.location,
            travelMode: travel,
            avoidFerries: true,
            avoidHighways: true,
            avoidTolls: true,
            optimizeWaypoints: true

        }
        if (wayPoint.length != 0) {
            directionServiceRoute.waypoints = [
                {
                    location: wayPoint,
                    stopover: true
                }];
        }
        if (travel == 'TRANSIT') {
            directionServiceRoute = {
                origin: position,
                destination: place.geometry.location,
                travelMode: travel,
                transitOptions: {
                    modes: ['BUS', 'RAIL', 'SUBWAY', 'TRAIN', 'TRAM'],
                    routingPreference: 'LESS_WALKING'
                },
                optimizeWaypoints: true
            }
            /**
             * waypoint in transit
             */
            if (wayPoint.length != 0) {
                directionServiceRoute.waypoints = [
                    {
                        location: [wayPoint, wayPoint],
                        stopover: true
                    }];
            }
        }
        // console.log(wayPoint);

        // console.log(directionServiceRoute);
        directionsService.route(directionServiceRoute, function (response, status) {
            if (status === 'OK') {
                // console.log(response);
                directionsDisplay.setDirections(response);
            } else {
                window.alert('Directions request failed due to ' + status);
            }
        });
    }


    function nearbySearchCallback(results, status, currentPosition) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            // for (var i = 0; i < results.length; i++) {
            console.log(results);
            createMarker(results[0]);
            drawItinirary(currentPosition, travelMode, results[0], '');

        }
    }

    function createMarker(place) {
        var infowindow = new google.maps.InfoWindow();
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
        });
        infowindow.setContent(place.name);
        infowindow.open(map, marker);

    }

    var markers = [];
    var missionPlace;

    function createMarkerWithValue(missions, travel) {
        missions = missions.missions;
        // console.log(missions)

        var place = missions[0].place;
        var infowindow;
        if (missions.length == 1) {

            infowindow = new google.maps.InfoWindow({
                content: '<h4>' + missions[0].missionName + '</h4><p>' + missions[0].missionPrice + '</p><p>' + missions[0].missionDescription + '</p>' + '<button class="draw-itin btn" data-mission=\'' + JSON.stringify(missions[0]) + '\'>Voir itiniéraire</button><a href="/coursefacile/mission/' + missions[0].missionId + '" class="btn btn-success">voir mission</a> '
            });
        } else {
            // console.log('here')
            var content = "";
            for (var i = 0; i < missions.length; i++) {
                content += '    <div class="panel panel-default">\n' +
                    '        <div class="panel-heading" role="tab" id="headingOne">\n' +
                    '            <h4 class="panel-title">\n' +
                    '                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse' + missions[i].missionId + '" aria-expanded="true" aria-controls="collapseOne">\n' +
                    '                    ' + missions[i].missionName +
                    '                </a>\n' +
                    '            </h4>\n' +
                    '        </div>\n' +
                    '        <div id="collapse' + missions[i].missionId + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">\n' +
                    '            <div class="panel-body">\n' + '<p>' + missions[i].missionPrice + '</p>' +
                    '              <p>' + missions[i].missionDescription + '</p>' + '<p><button class="draw-itin btn" data-mission=\'' + JSON.stringify(missions[i]) + '\'>Voir</button> </p><a href="/coursefacile/mission/' + missions[i].missionId + '" class="btn btn-success">voir mission</a>' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>\n'
            }
            // console.log(content);
            infowindow = new google.maps.InfoWindow({
                content: '<div class="panel-group" style="width: 300px" id="accordion" role="tablist" aria-multiselectable="true">' + content + '</div>'
            });
        }
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location,
        });
        marker.addListener('click', function () {
            infowindow.open(map, marker);
            $('.draw-itin').on('click', function (e) {
                e.preventDefault();
                // console.log($(this).data('mission'));
                var mission = $(this).data('mission');
                missionPlace = mission.place;
                console.log(missionPlace);
                draw = true;
                getClosestDestination(mission.missionKeyWord, missionPlace.geometry.location, draw, null, travel);
            })
        });
        markers.push(marker);

    }

    var draw = false

    function getClosestDestination(keyWord, position) {
        var getClosestDestinationPromises = new Promise(function (resolve, reject) {
            var service = new google.maps.places.PlacesService(map);
            service.nearbySearch({
                location: position,
                // radius: 10000,
                // type: ['store'],
                keyword: keyWord,
                rankBy: google.maps.places.RankBy.DISTANCE
            }, function (result, status) {
                console.log("====status====");
                console.log(status);
                if ("ZERO_RESULTS" != status) {
                    console.log("====getClosestDestination====");
                    console.log(result);
                    // var nearbySearchPositionCallbackPromise = nearbySearchPositionCallback(result, status, position,currentPos, draw, missionInfos, travel);
                    // nearbySearchPositionCallbackPromise.then(function(response){
                    var response = {result: result, status: status};
                    resolve(response);
                    // });
                } else {
                    reject(false);
                }
            });
        });
        return getClosestDestinationPromises;
    }

    function nearbySearchPositionCallback(results, status, chosedPosition, currentPos, draw, missionInfos, travel) {
        var nearbySearchPositionCallbackPromise = new Promise(function (resolve, reject) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                // for (var i = 0; i < results.length; i++) {
                var service = new google.maps.DistanceMatrixService();
                var origins = [];
                var destinations = [];
                origins.push(currentPos);
                origins.push(chosedPosition);
                console.log("=====result nearby position=====");
                console.log(results);
                console.log("=====chosedPosition=====");
                console.log(chosedPosition);
                for (var i = 0; i < results.length; i++) {
                    destinations.push(results[i].geometry.location);
                }
                console.log("===== destinations =====");
                console.log(destinations);
                // console.log(results);
                // console.log(missionPlace);
                service.getDistanceMatrix({
                    origins: origins,
                    destinations: destinations,
                    travelMode: travelMode,
                    avoidHighways: true,
                    avoidTolls: true
                }, function (response, status) {
                    console.log("====response====");
                    console.log(response);
                    var checkResponse = getDistanceMatrixcallback(response, status, draw, missionInfos, travel);
                    resolve(checkResponse);
                });

            }
        });
        return nearbySearchPositionCallbackPromise;

    }

    function compare(a, b) {
        if (a.distance < b.distance)
            return -1;
        if (a.distance > b.distance)
            return 1;
        return 0;
    }

    var nearestAdress;
    var missionsItineraries = [];

    function getDistanceMatrixcallback(response, status, draw, missionInfos, travel) {
        // console.log(response);
        var checkResponse = false;
        console.log(response);
        var currentPosToShopDist = response.rows[0];
        var missionPosToShopDist = response.rows[1];
        console.log("=== currentPosToShopDist ===");
        console.log(currentPosToShopDist);
        console.log("=== missionPosToShopDist ===");
        console.log(missionPosToShopDist);
        var distances = [];
        for (var i = 0; i < currentPosToShopDist.elements.length; i++) {
            distances.push({
                adressIndex: i,
                distance: currentPosToShopDist.elements[i].distance.value + missionPosToShopDist.elements[i].distance.value
            });
        }
        distances.sort(compare);
        console.log("=== distances ===");
        console.log(distances);
        // for (var i = 0; i < distances.length; i++) {
        // console.log(distances[i]);
        // }
        // console.log(missionPlace);
        nearestAdress = response.destinationAddresses[distances[0].adressIndex];
        if (draw)
            checkResponse = drawItinirary(currentPosition, travel, missionPlace, nearestAdress);
        else {
            // console.log('here')
            missionsItineraries.push({
                distance: distances[0].distance,
                missionInfos: missionInfos,
                waypoint: nearestAdress
            });
            checkResponse = true;
        }
        return checkResponse;


    }


    var getCurrentPosition = function () {
        var getCurrentPositionPromise = new Promise(function (resolve, reject) {
            var currentPos = null;
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    currentPos = setPosition(position);
                    resolve(currentPos);
                });
            } else {
                console.log("Geolocation is not supported by this browser.");
                reject(Error("Geolocation is not supported by this browser."));
            }
        });
        return getCurrentPositionPromise;
    };

    function setPosition(position) {
        return {lat: position.coords.latitude, lng: position.coords.longitude};
    }

    if ($getItinerary.length) {

        function buildItineraryToShop() {
            var getCurrentPositionPromise = getCurrentPosition();
                // console.log(currentPosition);
            getCurrentPositionPromise.then(function (currentPos) {

                console.log("== buildItineraryToShop ==");
                console.log(currentPos);
                initMap('map', 15, currentPos);
                var keyWord = $getItinerary.data('key-word');
                createItinerary(keyWord, currentPos);
            })

        }

        $getItinerary.on('click', function () {
            buildItineraryToShop();
        });
        $('.travel-mode').on('click', function () {
            $('#map').html('');
            travelMode = $(this).data('travel-mode');
            buildItineraryToShop();
        });
    }

    /**
     * mission listing map
     */
    function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    }

    var missionArray = [];
    var $mapMissions = $('.col-mission-map');
    if ($mapMissions.length) {


        $('#show-map').on('click', function (e) {
            e.preventDefault();
            var travel = $('#travel-method').val();
            var city_id = getUrlParameter('city_id');
            var date = getUrlParameter('date');
            var de = getUrlParameter('de');
            var a = getUrlParameter('a');
            var data = {
                'city_id': city_id,
                'date': date,
                'from': de == undefined ? "" : de,
                'to': a == undefined ? "" : a
            };
            $mapMissions.html('');
            missionArray = [];
            var $missionMap = $('<div id="map-missions" >');
            $mapMissions.append($missionMap);
            $.ajax({
                method: 'get',
                data: data,
                url: prefixPath + '/get-missions',
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if (data.length) {
                        getCurrentPosition().then(function (currentPos) {
                            initMap('map-missions', 13, currentPos);
                            // console.log(test);
                            // console.log(currentPosition);
                            var processDataPromises = [];
                            for (var i = 0; i < data.length; i++) {
                                var mission = data[i];
                                processDataPromises.push(processData(mission));
                            }
                            Promise.all(processDataPromises).then(function (values) {
                                // console.log(values);
                                // console.log(missionArray);
                                for (var i = 0; i < missionArray.length; i++) {
                                    var missions = missionArray[i];
                                    console.log(missions.missions.length);
                                    console.log("=====================");
                                    var getClosetstMissionDataPromises = [];
                                    for (var j = 0; j < missions.missions.length; j++) {
                                        console.log("===========**missions.missions***==========");
                                        console.log(missions.missions[j]);
                                        getClosetstMissionDataPromises.push(getClosetstMissionData(missions.missions[j], currentPos));
                                    }
                                    Promise.all(getClosetstMissionDataPromises).then(function (values) {
                                        console.log(values);
                                        missionsItineraries.sort(function (a, b) {
                                            return (a.distance > b.distance) ? 1 : ((b.distance > a.distance) ? -1 : 0);
                                        });
                                        for (var j = 0; j < missionsItineraries.length; j++) {
                                            console.log(missionsItineraries[j]);
                                        }
                                        var wayPoint = (missionsItineraries[0] == undefined) ? "" : missionsItineraries[0].waypoint;
                                        console.log(missionsItineraries);
                                        drawItinirary(currentPos, travel, missionsItineraries[0].missionInfos.place, wayPoint);
                                        createMarkerWithValue(missions, travel);
                                    });

                                }
                            });
                        });


                    }
                }
            });
        });


        function getClosetstMissionData(mission, currentPos) {
            console.log(mission.place.geometry.location);
            var getClosetstMissionDataPromise = new Promise(function (resolve, reject) {
                var getClosestDestinationPromise = getClosestDestination(mission.missionKeyWord, mission.place.geometry.location, currentPos);
                getClosestDestinationPromise.then(function (response) {
                    var nearbySearchPositionCallbackPromise = nearbySearchPositionCallback(response.result, response.status, mission.place.geometry.location, currentPos, false, mission, '')
                    nearbySearchPositionCallbackPromise.then(function (response) {
                        resolve(response);
                    });
                });
            });
            return getClosetstMissionDataPromise;
        }

        function pushMission(mission) {
            var found = false;
            // console.log(missionArray);
            for (var i = 0; i < missionArray.length; i++) {
                if (missionArray[i].id == mission.ownerId) {
                    missionArray[i].missions.push(mission);
                    found = true;
                    break;
                }
            }
            if (!found)
                missionArray.push({
                    id: mission.ownerId,
                    missions: [mission]
                });
        }

        function processData(mission) {
            var processDataPromise = new Promise(function (resolve, reject) {
                $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address=' + mission.ownerAdress, function (data) {
                    mission.place = data.results[0];
                    console.log(mission.place);
                    pushMission(mission);
                    resolve(mission);
                });
            });

            return processDataPromise;
        }
    }
    var $sliderRangePrice = $(".slider-range-price");
    if ($sliderRangePrice.length) {
        var min = 5, max = 50;
        var $minP = $('#minP');
        var $maxP = $('#maxP');
        if ($minP.length && $maxP.length) {
            min = $minP.val();
            max = $maxP.val();
        }
        $sliderRangePrice.slider({
            range: true,
            min: 0,
            max: 200,
            values: [min.length ? min : 5, max.length ? max : 55],
            slide: function (event, ui) {
                $("#amount").val("Prix: de " + ui.values[0] + " € - à " + ui.values[1] + " €");
            },
            change: function (event, ui) {
                $('#minP').val(ui.values[0]);
                $('#maxP').val(ui.values[1]);
                console.log($(this).val());

            }
        });


        if (min.length && max.length)
            $("#amount").val("Prix: de " + min +
                " € - à " + max + " €");
        else
            $("#amount").val("Interval de prix");

    }
    var $reset = $('#reset-search-form');
    if ($reset.length) {
        $reset.on('click', function () {
            $("#amount").val("Interval de prix");
            $('#minP').val('');
            $('#maxP').val('');
            $('#de').val('');
            $('#a').val('');
        });

    }
    var $avatarProfile = $('#avatar-profile');
    if ($avatarProfile.length) {
        $avatarProfile.on('change', function () {
            var input = this;
            var url = $(this).val();
            var ext = url.substring(url.lastIndexOf('.') + 1).toLowerCase();
            if (input.files && input.files[0] && (ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg")) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#profile-photo').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);

                $('#form-edit-profile-photo').submit();
            }
            else {
                $('#img').attr('src', prefixPath + '/images/people.png');
            }
        });
    }
    var $showSideBar = $('#show-side-bar');
    if ($showSideBar.length) {
        $showSideBar.on('click', function (e) {
            e.preventDefault();
            $(this).parent().toggleClass('open');
            $('#show-side-bar-box').toggleClass('open');
        });
    }
})
;
