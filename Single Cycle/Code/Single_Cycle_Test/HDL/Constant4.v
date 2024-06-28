module Constant4 #(parameter size=4,parameter Const=4) (
    output [size-1:0] const_value 
);


assign const_value = Const;

endmodule