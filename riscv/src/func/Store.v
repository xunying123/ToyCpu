`define SB 6'd27
`define SH 6'd28
`define SW 6'd29


module Store(
    input wire [5:0] order,
    output reg is
);

always @(*) begin
    if(order==`SB || order==`SH || order==`SW) begin
        is=1'b1;
    end
    else begin
        is=1'b0;
    end
end

endmodule