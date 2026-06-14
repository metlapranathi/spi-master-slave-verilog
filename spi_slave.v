module spi_slave(
    input sclk,
    input rst,
    input ss,
    input mosi,

    output reg [7:0] data_out,
    output reg done
);

reg [7:0] shift_reg;
reg [3:0] bit_count;

always @(posedge sclk or posedge rst)
begin
    if(rst)
    begin
        shift_reg <= 0;
        bit_count <= 0;
        data_out <= 0;
        done <= 0;
    end

    else if(!ss)
    begin
        shift_reg <= {shift_reg[6:0], mosi};
        bit_count <= bit_count + 1;

        if(bit_count == 7)
        begin
            data_out <= {shift_reg[6:0], mosi};
            done <= 1;
            bit_count <= 0;
        end
    end
end

endmodule