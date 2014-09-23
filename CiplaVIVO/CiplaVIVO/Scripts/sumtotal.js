//
// This function will allow users to insert only numbers in the textboxes.
//

function onlyNumbers(evt) {
    var e = event || evt; // for trans-browser compatibility
    var charCode = e.which || e.keyCode;

    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}


+$(function () {
    var textBox1 = $('input:text[id$=txtRegulatoryCost]').keyup(foo);
    var textBox2 = $('input:text[id$=txtSampleCost]').keyup(foo);
    var textBox3 = $('input:text[id$=txtRDCost]').keyup(foo);
    var textBox4 = $('input:text[id$=txtQACost]').keyup(foo);
    var textBox5 = $('input:text[id$=txtAuditCost]').keyup(foo);
    var textBox6 = $('input:text[id$=txtOtherCost]').keyup(foo);
    var textBox7 = $('input:text[id$=txtTotalCost]').keyup(Lockallrest);
    
    function foo() {
        var value1 = textBox1.val();
        var value2 = textBox2.val();
        var value3 = textBox3.val();
        var value4 = textBox4.val();
        var value5 = textBox5.val();
        var value6 = textBox6.val();
        var sum = add(value1, value2, value3, value4, value5, value6);

        $('input:text[id$=txtTotalCost]').val(sum);

        if (sum > 0)
        {
            $('input:text[id$=txtTotalCost]').prop("disabled",true);
        }
        else {
            $('input:text[id$=txtTotalCost]').prop("disabled", false);
        }
    }

    function Lockallrest() {
        if ($('input:text[id$=txtTotalCost]').val() > 0)
        {
            $('input:text[id$=txtRegulatoryCost]').prop("disabled", true);
            $('input:text[id$=txtSampleCost]').prop("disabled", true);
            $('input:text[id$=txtRDCost]').prop("disabled", true);
            $('input:text[id$=txtQACost]').prop("disabled", true);
            $('input:text[id$=txtAuditCost]').prop("disabled", true);
            $('input:text[id$=txtOtherCost]').prop("disabled", true);
        }
        else
        {
            $('input:text[id$=txtRegulatoryCost]').prop("disabled", false);
            $('input:text[id$=txtSampleCost]').prop("disabled", false);
            $('input:text[id$=txtRDCost]').prop("disabled", false);
            $('input:text[id$=txtQACost]').prop("disabled", false);
            $('input:text[id$=txtAuditCost]').prop("disabled", false);
            $('input:text[id$=txtOtherCost]').prop("disabled", false);
        }       
    }

    function add() {
        var sum = 0;
        for (var i = 0, j = arguments.length; i < j; i++) {
                sum += parseFloat(arguments[i]);
        }
        return sum;
    }
});


