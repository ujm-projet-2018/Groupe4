$(function () {
    var $cityInput = $('#city');

    wow = new WOW(
        {})
        .init();

    $('#date').datepicker({
        weekStart: 1,
        format: 'dd/mm/yyyy'
    });

    $cityInput.autocomplete({
        valueKey:'title',
        source: [
            function (q, add) {
            console.log(q);
                var $cityIdInput = $("#city_id");
                if($cityIdInput.length)
                    $cityIdInput.val("");
                $.ajax({
                    type: 'GET',
                    url: '/coursefacile/filterCities',
                    data: {city: q},
                    dataType: 'json',
                    cache:false,
                    success: function (data) {
                        add(data);
                    }

                });
            }
        ]
    }).on('selected.xdsoft',function(e,field){
        var $cityIdInput = $("#city_id");
        if(!$cityIdInput.length) {
            $cityIdInput = $("<input>", {id: "city_id", "name": "city_id", "type": "hidden"});
            $cityInput.parent().append($cityIdInput);
        }
        $cityIdInput.val(field.id);


    });


});