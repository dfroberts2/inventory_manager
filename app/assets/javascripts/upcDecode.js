$(document).ready(function(){
    $("input[type=file]").on("change", function(e) {
        if (e.target.files && e.target.files.length) {
            decode(URL.createObjectURL(e.target.files[0]));
        }
    });

    function decode(src) {
        Quagga.decodeSingle({
            decoder: {
                readers: ["upc_reader"]
            },
            locate: true,
            src: src
        }, function(result){
            if(result.codeResult) {
                var code = ""
                if (result.codeResult.code.length < 13) {
                    code = "0" + result.codeResult.code
                }
                else {
                    code = result.codeResult.code
                }
                $(".upc-input").val(code);
                console.log("result", result.codeResult.code);
            } else {
                console.log("not detected");
            }
        });
    }
})