console.log('loaded sales.js')//check that the file is loaded

$(document).on('change','#client_list', function () {//change states when user changes country
   load_clients_location();
});

function load_clients_location(){
    var request = "/people/find_location_given_people_id?people_id=" //access controller of interest
    + $('#client_list').val();
    if(  !isNaN(parseFloat($('#client_list').val() ))){
        var aj = $.ajax({
            url: request,
            type: 'get',
            data: $(this).serialize()
        }).done(function (data) {
         get_location(data);//modify the majors' dropdown
     }).fail(function (data) {
         console.log('AJAX request has FAILED');
     });
 }
};

function get_location(data) {                                                                                       
        var location = 'Calle y número: '+ data.location.address + ', Colonia: ' + data.location.neighborhood + ',  Delegación: '  + data.location.delegation+ ', Código postal: '+ data.location.zip_code;        $("#location").text(location);  
        $("#location").text(location);

        var city = data.city.name;
        $("#city").text(city);

        var state = data.state.name;
        $("#state").text(state);

        var country = data.country.name;
        $("#country").text(country);
};
