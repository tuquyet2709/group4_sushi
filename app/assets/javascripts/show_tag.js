var tag_value;
var list_tag;
var data= [];
var input_field


setTimeout(function () {
    tag_value = $("#tag_work").text();
    list_tag = tag_value.split(",");
    // data = [{tag: tag_value,}];
}, 500);

setTimeout(function(){
    for (var i = 0; i <list_tag.length ; i++) {
        data.push({tag: list_tag[i],});
    }

    $('.chips-initial').chips({
        data,
    });

    input_field = document.querySelector(".input-field");
    input_field.classList.remove("input-field");
    input_field.classList.remove("chips");
    input_field.classList.remove("chips-initial");
    input_field.classList.remove("chipssss");

    $("i").remove(".material-icons");
    $("input").remove(".chipssss");
}, 1000);