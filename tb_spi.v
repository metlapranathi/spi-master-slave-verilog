`timescale 1ns/1ps

module tb_spi;

reg clk;
reg rst;
reg start;
reg [7:0] data_in;

wire mosi;
wire sclk;
wire ss;
wire master_done;

wire [7:0] slave_data;
wire slave_done;

// Master Instance
spi_master MASTER(
    .clk(clk),
    .rst(rst),
    .start(start),
    .data_in(data_in),
    .mosi(mosi),
    .sclk(sclk),
    .ss(ss),
    .done(master_done)
);

// Slave Instance
spi_slave SLAVE(
    .sclk(sclk),
    .rst(rst),
    .ss(ss),
    .mosi(mosi),
    .data_out(slave_data),
    .done(slave_done)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    start = 0;
    data_in = 0;

    #20;
    rst = 0;

    // Send A5
    #10;
    data_in = 8'hA5;
    start = 1;

    #10;
    start = 0;

    wait(slave_done);

    $display("Master Sent     = %h", data_in);
    $display("Slave Received  = %h", slave_data);

    if(slave_data == data_in)
        $display("PASS");
    else
        $display("FAIL");

    #20;
    $finish;

end

endmodule