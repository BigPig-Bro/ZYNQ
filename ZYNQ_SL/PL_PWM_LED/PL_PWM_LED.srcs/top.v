module top(
	input clk_100m,
	output [1:0] led
	);

parameter RATE  = 32'D1024;
parameter RATE_CNT_MAX = 32'd50_000_000 / RATE - 32'd1;//�?个波计数上限

reg [31:0] clk_update;
always@(posedge clk_100m) clk_update <= clk_update + 1;

reg [1:0][31:0] d = {32'd70,32'd0};

always@(posedge clk_update[22]) begin
	d[0] <= d[1];
	d[1] <= d[0];
end
	

reg [31:0] rate_cnt;
always@(posedge clk_100m)
	if(rate_cnt < RATE_CNT_MAX)
		rate_cnt <= rate_cnt + 32'd1;
	else
		rate_cnt <= 32'd0;


pwm_ctr m0(
.clk 	 (clk_100m	),
.cnt 	 (rate_cnt),
.duty 	 (d[0]),
.rate    (RATE),
.pwm_out (led[0])
);


pwm_ctr m1(
.clk 	 (clk_100m	),
.cnt 	 (rate_cnt),
.duty 	 (d[1]),
.rate    (RATE),
.pwm_out (led[1])
);


endmodule 
