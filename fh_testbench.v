
module t_fullhouse;
  reg [81*4:1] a;
  wire [81*4:1] a_out;
  reg t_clk,rst,start;
  initial #1000 $finish;
  fullhouse M1 (a_out,a,t_clk,rst,start);
  initial begin 
    $dumpfile("dump.vcd");		  
    $dumpvars(0,M1);  
    #1 rst=0;
    #2 begin rst=1; start=1; end
    
  end
     initial begin                    
    t_clk=1'b0;                     
       repeat(100)                     
       #1 t_clk=~t_clk;                
 end 
  initial 
    begin 
      #2 a={324'h425819376687453210300276084749560120013790650806132947108945702064320891972601005};
    end
  initial
    begin
      $monitor ($time,,"%h", a_out);
    end
  
  
endmodule
