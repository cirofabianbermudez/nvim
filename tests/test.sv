module test (
    input clk,
    input rst,
    output reg value
);

  always_ff @(posedge clk, posedge rst) begin
    if (rst) begin
      value <= 0;
    end else begin
      value <= 1;
    end
  end

  assign value = 0;

endmodule


