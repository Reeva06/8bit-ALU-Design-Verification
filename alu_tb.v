`timescale 1ns/1ps

module alu_tb;
    parameter WIDTH = 8;

    reg  [WIDTH-1:0] a, b;
    reg  [3:0]       opcode;
    wire [WIDTH-1:0] result;
    wire             zero, carry, negative, overflow;

    alu_8bit #(WIDTH) uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .zero(zero),
        .carry(carry),
        .negative(negative),
        .overflow(overflow)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_tb);

        $display("---------------------------------------------------");
        $display("Starting Parameterized ALU Verification Tests...");
        $display("---------------------------------------------------");

        // Test 1: Addition (25 + 10 = 35)
        a = 8'd25; b = 8'd10; opcode = 4'b0000; #10;
        if (result !== 8'd35) $error("ADD failed! Got: %0d", result);
        else $display("PASS: ADD -> %0d + %0d = %0d", a, b, result);

        // Test 2: Subtraction (25 - 10 = 15)
        a = 8'd25; b = 8'd10; opcode = 4'b0001; #10;
        if (result !== 8'd15) $error("SUB failed! Got: %0d", result);
        else $display("PASS: SUB -> %0d - %0d = %0d", a, b, result);

        // Test 3: Bitwise AND
        a = 8'hAA; b = 8'h0F; opcode = 4'b0010; #10;
        if (result !== 8'h0A) $error("AND failed! Got: %h", result);
        else $display("PASS: AND -> %h & %h = %h", a, b, result);

        // Test 4: Bitwise XOR
        a = 8'hF0; b = 8'hFF; opcode = 4'b0100; #10;
        if (result !== 8'h0F) $error("XOR failed! Got: %h", result);
        else $display("PASS: XOR -> %h ^ %h = %h", a, b, result);

        // Test 5: Zero Flag check (50 - 50 = 0)
        a = 8'd50; b = 8'd50; opcode = 4'b0001; #10;
        if (!zero || result !== 8'd0) $error("Zero Flag check failed!");
        else $display("PASS: Zero Flag asserted correctly when result = 0");

        // Test 6: Logical Shift Left
        a = 8'b00001111; b = 8'd0; opcode = 4'b1000; #10;
        if (result !== 8'b00011110) $error("Shift Left failed!");
        else $display("PASS: Left Shift -> %b << 1 = %b", a, result);

        #50;
        $display("---------------------------------------------------");
        $display("All ALU Tests Executed Successfully!");
        $display("---------------------------------------------------");
        $finish;
    end
endmodule
