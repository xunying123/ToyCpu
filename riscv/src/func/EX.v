`define LUI 6'd0
`define AUIPC 6'd1
`define ADD 6'd2
`define SUB 6'd3
`define SLL 6'd4
`define SLT 6'd5
`define SLTU 6'd6
`define XOR 6'd7
`define SRL 6'd8
`define SRA 6'd9
`define OR 6'd10
`define AND 6'd11
`define JALR 6'd12
`define LB 6'd13
`define LH 6'd14
`define LW 6'd15
`define LBU 6'd16
`define LHU 6'd17
`define ADDI 6'd18
`define SLTI 6'd19
`define SLTIU 6'd20
`define XORI 6'd21
`define ORI 6'd22
`define ANDI 6'd23
`define SLLI 6'd24
`define SRLI 6'd25
`define SRAI 6'd26
`define SB 6'd27
`define SH 6'd28
`define SW 6'd29
`define JAL 6'd30
`define BEQ 6'd31
`define BNE 6'd32
`define BLT 6'd33
`define BGE 6'd34
`define BLTU 6'd35
`define BGEU 6'd36


module EX(
    input wire [5:0] order,
    input wire [31:0] vj,
    input wire [31:0] vk,
    input wire [31:0] A,
    input wire [31:0] pc,
    output reg [31:0] value,
    output reg [31:0] topc
);

always @(*) begin

	if(order==`JALR)topc=(vj+A)&(~1);
    else topc=0;//for_latch
    
	if(order==`LUI)value=A;
	else if(order==`AUIPC)value=pc+A;

	else if(order==`ADD)value=vj+vk;
	else if(order==`SUB)value=vj-vk;
	else if(order==`SLL)value=vj<<(vk&5'h1f);
	else if(order==`SLT)value=($signed(vj)<$signed(vk))?1:0;
	else if(order==`SLTU)value=(vj<vk)?1:0;
	else if(order==`XOR)value=vj^vk;
	else if(order==`SRL)value=vj>>(vk&5'h1f);
	else if(order==`SRA)value=$signed(vj)>>(vk&5'h1f);
	else if(order==`OR)value=vj|vk;
	else if(order==`AND)value=vj&vk;

	else if(order==`JALR) begin
		value=pc+4;
	end


	else if(order==`ADDI)value=vj+A;
	else if(order==`SLTI)value=($signed(vj)<$signed(A))?1:0;
	else if(order==`SLTIU)value=(vj<A)?1:0;
	else if(order==`XORI)value=vj^A;
	else if(order==`ORI)value=vj|A;
	else if(order==`ANDI)value=vj&A;
	else if(order==`SLLI)value=vj<<A;
	else if(order==`SRLI)value=vj>>A;
	else if(order==`SRAI)value=$signed(vj)>>A;
	

	else if(order==`JAL) begin
		value=pc+4;
	end


	else if(order==`BEQ) begin
		value=(vj==vk?1:0);
	end
	else if(order==`BNE) begin
		value=(vj!=vk?1:0);
	end
	else if(order==`BLT) begin
		value=($signed(vj)<$signed(vk)?1:0);
	end
	else if(order==`BGE) begin
		value=($signed(vj)>=$signed(vk)?1:0);
	end
	else if(order==`BLTU) begin
		value=(vj<vk?1:0);
	end
	else if(order==`BGEU) begin
		value=(vj>=vk?1:0);
	end
	else value=0;//for_latch

end





endmodule