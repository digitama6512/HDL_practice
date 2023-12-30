`timescale 1ns/1ps

interface arb_if (input bit clk);
    logic[1:0] grant, request;
    bit rst;

    clocking cb @(posedge clk);
        default input #15ns output #30ns;
        output request;
        input grant;
    endclocking
    
    modport TEST (
        clocking cb,
        output rst
    );

    modport DUT (
        input request,
        input rst,
        input clk,
        output grant
    );

endinterface //arb_if (input bit clk)