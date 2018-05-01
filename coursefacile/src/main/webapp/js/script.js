$(function () {
    var MAX_MSG = 5;

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
                    console.log(q);
                    var $cityIdInput = $("#city_id");
                    if ($cityIdInput.length)
                        $cityIdInput.val("");
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
        $profile_form.find('#confirm').click(function (e) {
            e.preventDefault();
            if ($profile_form.valid())
                bootbox.prompt({
                    title: 'Veuillez entrer votre mot de passe actuel',
                    placeholder: 'mot de passe',
                    inputType: 'password',
                    size: 'small',
                    buttons: {
                        confirm: {
                            label: 'Confirmer',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'Annuler',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if (result === null) {
                        } else {
                            $.ajax({
                                method: 'POST',
                                url: '/coursefacile/confirm-pwd',
                                data: {confirmationPwd: result},
                                dataType: 'json',
                                success: function (data) {
                                    console.log("kaka");
                                    if (data.length && data[0]) {
                                        $('#check-submit').val(data[1]);
                                        $profile_form.submit();
                                    }
                                }
                            });
                        }
                    }
                });
            else {
                $(window).scrollTop($("em.error:first").offset().top - 200);
            }
        })

    }

    function correctDate(val) {
        return val < 10 ? "0" + val : val;
    }

    $btnSendMsg = $('#send-message');
    if ($btnSendMsg.length) {
        var $chatHistory = $('.chat-history');
        $chatHistory.data("pag-start", 0);
        $chatHistory.data("pag-end", MAX_MSG);
        var $chatContainer = $('<ul>');
        var chatClient = new WebSocket("ws://" + location.host + "/coursefacile/chat/" + $btnSendMsg.parent().data('sender'));
        $chatHistory.scrollTop($chatHistory.prop("scrollHeight"));
        chatClient.onmessage = function (evt) {

            var msg = JSON.parse(evt.data);
            console.log(msg);
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
            console.log(msg);
            //send message
            chatClient.send(msg);
            $message.val('');

        });

        $chatHistory.scroll(function () {
            var pos = $chatHistory.scrollTop();
            if (pos == 0) {
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
                            for (var i = 2; i < data.length; i++) {
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
                                $chatHistory.scrollTop($chatHistory.prop("scrollHeight") - ($chatHistory.prop("scrollHeight") * 85 / 100))
                            }
                        }
                    }
                });
            }
        });

    }
    var $formTime = $('.form_time');
    if ($formTime.length)
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

});
