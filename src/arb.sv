`timescale 1ns/1ps

module arb(arb_if.DUT arbif);
    initial begin
        $monitor("@%0t: req = %h", $time, arbif.request);
    end
endmodule