`timescale 1ns / 1ps
module ram(Addr, Dout , Din, CLK, MemWrite , button_a , button_w , button_d , button_s , Addr2 , Dout2 , v_sync);
    input [9:0] Addr,Addr2; 
    input [31:0] Din;
    input CLK, MemWrite;  
    input button_a,button_w,button_d,button_s;  
    input v_sync;
    output [31:0] Dout,Dout2;     
    reg [31:0] RAM[999:0]; 

    integer i;
    initial begin
        for (i=0 ; i<=999 ; i=i+1) begin
            RAM[i] = 0;
        end
    end

    always @(posedge CLK) begin
        if (MemWrite) begin
                RAM[Addr] <= Din;   
        end
    end

    // //更改move_direction
    // always @(posedge button_a or posedge button_w or posedge button_d or posedge button_s) begin
    //     if (button_a==1 && button_w==0 && button_d==0 && button_s==0) begin
    //         RAM[0] <= 32'h00000001;
    //     end
    //     else if (button_a==0 && button_w==1 && button_d==0 && button_s==0) begin
    //         RAM[0] <= 32'h00000002;
    //     end
    //     else if (button_a==0 && button_w==0 && button_d==1 && button_s==0) begin
    //         RAM[0] <= 32'h00000003;
    //     end
    //     else if (button_a==0 && button_w==0 && button_d==0 && button_s==1) begin
    //         RAM[0] <= 32'h00000004;
    //     end
        
    // end

    // //更改v_sync_finished
    // always @(negedge v_sync) begin
    //     RAM[1] <= 32'h00000001;
    // end

    assign Dout = RAM[Addr];
    assign Dout2 = RAM[Addr2];
    
endmodule