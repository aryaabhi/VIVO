﻿//
// This function will allow users to insert only numbers in the textboxes.
//

function onlyNumbers(evt) {
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

//
// This function is to calculate all the values of textboxes.
//

function Add() { }

/*
function Add() {
    var a=0, b=0, c=0, d=0, e=0, f=0, g=0;

    //
    // If textbox value is null i.e empty, then the below mentioned if condition will 
    // come into picture and make the value to '0' to avoid errors.
    
    //window.alert(a);
    
    
    var a = parseInt(document.getElementById("<%=txtRegulatoryCost.ClientID %>").value);
    window.alert(a);
    if (isNaN(a) == true) {
        a = 0;
    }
    
    var b = parseInt(document.getElementById('txtSampleCost').value);
    if (isNaN(b) == true) {
        b = 0;
    }
    var c = parseInt(document.getElementById('txtRDCost').value);
    if (isNaN(c) == true) {
        c = 0;
    }
    var d = parseInt(document.getElementById('txtQACost').value);
    if (isNaN(d) == true) {
        d = 0;
    }
    var e = parseInt(document.getElementById('txtAuditCost').value);
    if (isNaN(e) == true) {
        e = 0;
    }
    var f = parseInt(document.getElementById('txtOtherCost').value);
    if (isNaN(f) == true) {
        f = 0;
    }
    document.getElementById("txtTotalCost").value = a + b + c + d + e + f;
}


*/



