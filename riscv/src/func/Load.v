`define LB 6'd13
`define LH 6'd14
`define LW 6'd15
`define LBU 6'd16
`define LHU 6'd17



module Load(
    input wire [5:0] order,
    output reg is
);

always @(*) begin
    if(order==`LB || order==`LH || order==`LW || order==`LBU || order==`LHU) begin
        is=1'b1;
    end
    else begin
        is=1'b0;
    end
end

endmodule