console.log('loaded people.js')//check that the file is loaded

$(document).on('change','#countries_list', function () {//change states when user changes country
   load_states_from_countries_dropdown();
});

$(document).on('change','#states_list', function () {//change states when user changes country
   load_cities_from_state_dropdown();
});

$(document).ready(load_states_from_countries_dropdown);
$(document).ready(load_cities_from_states_dropdown);

function load_states_from_countries_dropdown(){
    var request = "/states/find_states_given_country_id?country_id=" //access controller of interest
    + $('#countries_list').val();
    if(  !isNaN(parseFloat($('#countries_list').val() ))){
        var aj = $.ajax({
            url: request,
            type: 'get',
            data: $(this).serialize()
        }).done(function (data) {
         change_states(data);//modify the majors' dropdown
     }).fail(function (data) {
         console.log('AJAX request has FAILED');
     });
 }
};

function load_cities_from_states_dropdown(){
    var request = "/cities/find_cities_given_state_id?state_id=" //access controller of interest
    + $('#states_list').val();
    if(  !isNaN(parseFloat($('#states_list').val() ))){
        var aj = $.ajax({
            url: request,
            type: 'get',
            data: $(this).serialize()
        }).done(function (data) {
         change_cities(data);//modify the majors' dropdown
     }).fail(function (data) {
         console.log('AJAX request has FAILED');
     });
 }
};

//modify the states' dropdown
function change_states(data) { 
    $("#states_list").empty();//remove all states majors
    for(i = 0;i<data.length;i++){ 
        $("#states_list").append(//add in an option for each major
            $("<option></option>").attr("value", data[i].id).text(data[i].name)
            );
    }
};

function change_cities(data) { 
    $("#cities_list").empty();//remove all states majors
    for(i = 0;i<data.length;i++){ 
        $("#cities_list").append(//add in an option for each major
            $("<option></option>").attr("value", data[i].id).text(data[i].name)
            );
    }
};