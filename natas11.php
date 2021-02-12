<?php

$cookie = "ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw%3D";
$defaultData = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");
$desiredData = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");

/**
 * Performs XOR operation on the given parameters.
 *
 * @param in1 the first input
 * @param in2 the second input
 * @return the result of XOR operation
 */
function xor_encrypt($in1, $in2) {
    
    $outText = '';
    for($i=0; $i<strlen($in1); $i++) {
        $outText .= $in1[$i] ^ $in2[$i % strlen($in2)];
    }       
    return $outText;
}

/**
 * Returns true if the given string starts with the given start string.
 *
 * @param string the string to be checked
 * @param startString the pattern to see if the given string starts with
 * @return true if the given staring starts with the given start string
 */
function starts_with($string, $startString){ 

    $len = strlen($startString); 
    return (substr($string, 0, $len) === $startString); 
} 

/**
 * Returns a repetetive pattern in the given string.
 *
 * @param in the input
 * @return the repetetive pattern in the given string
 */
function get_repetetive_pattern($in){

    $pattern = '';
    for($i=1; $i<strlen($in); $i++){
        if($in[$i] == $in[0]){
            $len = $i - 0;
            $wrongPattern = 0;
            $candidatePattern = substr($in, 0, $len);
            for ($j=0; $j<strlen($in); $j=$j+$len){
                if (!starts_with($candidatePattern, substr($in, $j, $len))){
                    $wrongPattern = 1;
                    break;
                }
            }
            if ($wrongPattern == 0){
                $pattern = $candidatePattern;
                break;
            }
        }
    }
    return $pattern;
}

$key = get_repetetive_pattern(xor_encrypt(json_encode($defaultData), base64_decode($cookie)));
$cookieToSet = base64_encode(xor_encrypt(json_encode($desiredData), $key));
$password = shell_exec("curl --silent --user natas11:U82q5TCMMQ9xuFoI3dYX61s7OZD9JKoK --cookie data=$cookieToSet http://natas11.natas.labs.overthewire.org/ | grep 'The password for natas12 is' | grep -Eo [A-Za-z0-9]{32}");
print("The password for natas12 is: $password");
