`timescale 1ns / 1ps

module tb_alu;

reg [7:0] A;
reg [7:0] B;
reg [2:0] sel;

wire [7:0] Result;
wire Carry;
wire Zero;

// Instantiate ALU
alu uut (
    .A(A),
    .B(B),
    .sel(sel),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero)
);

initial
begin

    // Addition
    A = 8'd10;
    B = 8'd5;
    sel = 3'b000;
    #10;

    // Subtraction
    sel = 3'b001;
    #10;

    // AND
    sel = 3'b010;
    #10;

    // OR
    sel = 3'b011;
    #10;

    // XOR
    sel = 3'b100;
    #10;

    // NOT
    sel = 3'b101;
    #10;

    // Left Shift
    sel = 3'b110;
    #10;

    // Right Shift
    sel = 3'b111;
    #10;

    // Carry Test
    A = 8'd255;
    B = 8'd1;
    sel = 3'b000;
    #10;

    // Zero Flag Test
    A = 8'd10;
    B = 8'd10;
    sel = 3'b001;
    #10;

    $stop;

end

endmodule