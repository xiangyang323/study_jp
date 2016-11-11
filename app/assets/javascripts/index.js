function testWord(local){
    //if($(".word_true").css("display").indexOf("inline") != -1){
    //    alert("去下一个");
    //    return;
    //}
    $(".word_error").hide();
    $(".word_true").hide();

    var value = $('#input_test').val();
    var type = $('#input_test').attr("test");
    var word_id = $('#input_test').attr("word_id");
    console.log("value: " + value + " type:" + type);
    if(value == ""){
        alert("请输入");
        return;
    }
    var wordFlag = false;
    if(value == $("#test_" + type).html()){
        wordFlag = true;
        $(".word_true").show();
    }else{
        $(".word_error").show();
    }
    $('#input_test').val("");
    sendWordExam(word_id, wordFlag, 1, type, local);
}

function showWord(local){
    var word_id = $('#input_test').attr("word_id");
    $(".word span").removeClass("none");
    var type = $('#input_test').attr("test");
    sendWordExam(word_id, true, 1, type, local);
}

function sendWordExam(word_id, wordFlag, user_id, type, local){
    $.get("/courses/recode_word", {user_id: user_id, flag: wordFlag, word_id: word_id, type: type, local: local})
}