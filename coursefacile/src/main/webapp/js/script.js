$(function () {
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

    $('#date').datepicker({
        weekStart: 1,
        format: 'dd/mm/yyyy'
    });

    $cityInput.autocomplete({
        valueKey: 'title',
        source: [
            function (q, add) {
                var $cityIdInput = $("#city_id");
                if ($cityIdInput.length)
                    $cityIdInput.val("");
                $.ajax({
                    type: 'GET',
                    url: prefixPath + '/filterCities',
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
    $.validator.methods.email = function (value, element) {
        //^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$
        return this.optional(element) || /^[\w-\+]+(\.[\w]+)*@[\w-]+(\.[\w]+)*(\.[a-z]{2,})$/i.test(value);
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

});