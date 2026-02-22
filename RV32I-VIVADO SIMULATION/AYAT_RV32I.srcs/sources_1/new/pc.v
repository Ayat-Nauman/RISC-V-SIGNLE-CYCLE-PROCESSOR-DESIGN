module pc (
    input               clk,
    input               rst,
    input      [31:0] pc_next,
    output reg [31:0] pc_out
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            pc_out <= 32'd0;       // Reset PC to 0
        else
            pc_out <= pc_next;       // Update PC with next address
    end

endmodule

