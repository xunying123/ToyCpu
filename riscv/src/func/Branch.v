`define JALR 6'd12
`define JAL 6'd30
`define BEQ 6'd31
`define BNE 6'd32
`define BLT 6'd33
`define BGE 6'd34
`define BLTU 6'd35
`define BGEU 6'd36


module Branch (
    input wire [5:0] order,
    output reg is
);

always @(*) begin
    if(order==`BEQ || order==`BNE || order==`BLT || order==`BGE || order==`BLTU || order==`BGEU || order==`JAL || order==`JALR) is=1'b1;
    else is=1'b0;
end



endmodule