`timescale 1ns / 1ps

module alu(

    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] sel,

    output reg [7:0] Result,
    output reg Carry,
    output Zero

);

always @(*)
begin

    Carry = 1'b0;
    Result = 8'b0;

    case(sel)

        // Addition
        3'b000:
        begin
            {Carry, Result} = A + B;
        end

        // Subtraction
        3'b001:
        begin
            Result = A - B;
        end

        // AND
        3'b010:
        begin
            Result = A & B;
        end

        // OR
        3'b011:
        begin
            Result = A | B;
        end

        // XOR
        3'b100:
        begin
            Result = A ^ B;
        end

        // NOT
        3'b101:
        begin
            Result = ~A;
        end

        // Left Shift
        3'b110:
        begin
            Result = A << 1;
        end

        // Right Shift
        3'b111:
        begin
            Result = A >> 1;
        end

        default:
        begin
            Result = 8'b00000000;
            Carry = 1'b0;
        end

    endcase

end

assign Zero = (Result == 8'b00000000);

endmodule