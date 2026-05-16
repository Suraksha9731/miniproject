`timescale 1ns/1ps

module tb_digi_clock;

reg clk;
reg reset;
wire [5:0] sec;
wire [5:0] min;
wire [4:0] hour;

digi_clock uut (
    .clk(clk),
    .reset(reset),
    .sec(sec),
    .min(min),
    .hour(hour)
);

// clock generation
initial begin
    clk = 0;
    forever #10 clk = ~clk;  // 50MHz simulation
end

initial begin
    reset = 1;
    #50;
    reset = 0;

    #1000000;
    $finish;
end

initial begin
    $monitor("Time=%0t | %02d:%02d:%02d", $time, hour, min, sec);
end

endmodule
