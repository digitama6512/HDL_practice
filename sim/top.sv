`timescale 1ns/1ps

class RandcInside;
    int array[];
    randc bit [7:0] index;
    function new(
        input int a[]
    );
        array = a;
    endfunction

    function int pick();
        return array[index];
    endfunction

    constraint c_size {
        index < 7;
    }
endclass
 

class Packet;
	randc bit [8:0] data;
    constraint c_size {
        data < 7;
    }

endclass

module top;
    // bit clk;
    // always #50 clk = ~clk;

    // arb_if arbif(clk);
    // arb arb (
    //     arbif.DUT
    // );  // 例 4.1
    // test_with_cb t1 (
    //     arbif.TEST
    // );  // 例 4.2
    int j = 0;

    initial begin
        RandcInside ri;

        ri = new('{1, 3, 5, 7, 9, 11, 13});
        repeat(ri.array.size()) begin
            ri.randomize();
            $display("itr=%0d index=%2d pick=%2d", j, ri.index, ri.pick());
            j++;
        end
    end

    initial begin
		Packet pkt;
        pkt = new ();
		for (int i = 0 ; i < 10; i++) begin
			pkt.randomize();
			$display("itr=%0d data=%2d", i, pkt.data);
		end
	end
endmodule