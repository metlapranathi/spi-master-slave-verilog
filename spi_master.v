module spi_master(
    input clk,
    input rst,
    input start,
    input [7:0] data_in,

    output reg mosi,
    output reg sclk,
    output reg ss,
    output reg done
);

reg [7:0] shift_reg;
reg [3:0] bit_count;
reg active;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        mosi <= 0;
        sclk <= 0;
        ss <= 1;
        done <= 0;
        active <= 0;
        bit_count <= 0;
    end

    else
    begin
        done <= 0;

        if(start && !active)
        begin
            active <= 1;
            ss <= 0;
            shift_reg <= data_in;
            bit_count <= 0;
            sclk <= 0;
        end

        else if(active)
        begin
            sclk <= ~sclk;

            if(sclk == 0)
            begin
                mosi <= shift_reg[7];
                shift_reg <= shift_reg << 1;
                bit_count <= bit_count + 1;

                if(bit_count == 8)
                begin
                    active <= 0;
                    ss <= 1;
                    done <= 1;
                    sclk <= 0;
                end
            end
        end
    end
end

endmodule