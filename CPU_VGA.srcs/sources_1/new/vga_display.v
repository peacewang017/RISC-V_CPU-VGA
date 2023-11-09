module vga_display (
           input clk ,  //65MHz 
           input rst,
           input [11: 0] vdata ,
           
           output [10:0] vaddr_x,
           output [10:0] vaddr_y,
           
           output h_sync, v_sync,
           output reg [11: 0] vga  
       );

localparam h_active_pixels = 1024;
localparam v_active_pixels = 768;

wire [11: 0] x_counter;
wire [10: 0] y_counter;
wire in_display_area;

// function of this module:
// x_counter and y_counter range from 0 to (h/v)_total_piexls-1,
// just assignment vga to appropriate value according to x_counter and y_counter
// Notice: "scanning" occers here, which means x_counter and y_counter are increasing
vga_sync_generator vga_sync_generator(
        .clk(clk),
        .x_counter(x_counter),
        .y_counter(y_counter),
        .h_sync(h_sync),
        .v_sync(v_sync),
        .in_display_area(in_display_area)
    );

assign vaddr_x = (in_display_area) ? x_counter:0;
assign vaddr_y = (in_display_area) ? y_counter:0;


always @(posedge clk)
  begin
    if (in_display_area)
      begin
        vga <= vdata;
      end
    else vga <= 12'h000;
  end
 
endmodule