// var instance_var = [{ 'Apple': null}, {'Microsoft': null }, { 'Google': null}];
// instance_var.push({'ddddd': null});
// var instance = M.Chips.getInstance('.chips');
var chipInstance;
var chipData;
var chipValue = "";
var chipLength = 3;
$(document).ready(function () {
    $('.chips-autocomplete').chips({
        autocompleteOptions: {
            data: {
                'Apple': null,
                'Microsoft': null,
                'Google': null
            },
            limit: Infinity,
            minLength: 1
        }
    });

    chipInstance = M.Chips.getInstance($(".chips"));
    chipData = chipInstance.chipsData;
    setTimeout(function () {
        chipLength = chipData.length;
    }, 1000);
    // for (var i = 0; i < chipLength; i++) {
    //     chipValue += chipData[i].tag;
    // }
    // $("#tag").val(chipValue);
});

