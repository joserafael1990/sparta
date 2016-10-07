console.log('loaded cities.js')//check that the file is loaded

$(document).on('change','#country_list', function () {//change states when user changes country
   load_states_from_country_dropdown();
});


function load_states_from_country_dropdown(){
    var request = "/states/find_states_given_country_id?country_id=" //access controller of interest
    + $('#country_list').val();
    if(  !isNaN(parseFloat($('#country_list').val() ))){
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

//modify the states' dropdown
function change_states(data) { 
    $("#state_list").empty();//remove all states majors
    for(i = 0;i<data.length;i++){ 
        $("#state_list").append(//add in an option for each major
            $("<option></option>").attr("value", data[i].id).text(data[i].name)
            );
    }
};