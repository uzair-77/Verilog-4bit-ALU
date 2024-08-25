module Binary_Alu(
    input [3:0] A, B,
    input [1:0] sel,
    input M, Cin,
    output reg [3:0] Sum,
    output reg [3:0] Cout
);
    
    // Internal wire to hold intermediate carry-out values
    wire [3:0] internal_Cout;
    wire [3:0] temp_Sum;
    
    // Assign Cin to be used as the initial carry-in value
    assign internal_Cout[0] = Cin;
    
    always @(*) begin
        case (sel)
            2'b00: begin // Addition or Subtraction
                temp_Sum[0] = (A[0] ^ (B[0] ^ M)) ^ internal_Cout[0];
                internal_Cout[1] = (A[0] & (B[0] ^ M)) | ((A[0] ^ (B[0] ^ M)) & internal_Cout[0]);

                temp_Sum[1] = (A[1] ^ (B[1] ^ M)) ^ internal_Cout[1];
                internal_Cout[2] = (A[1] & (B[1] ^ M)) | ((A[1] ^ (B[1] ^ M)) & internal_Cout[1]);

                temp_Sum[2] = (A[2] ^ (B[2] ^ M)) ^ internal_Cout[2];
                internal_Cout[3] = (A[2] & (B[2] ^ M)) | ((A[2] ^ (B[2] ^ M)) & internal_Cout[2]);

                temp_Sum[3] = (A[3] ^ (B[3] ^ M)) ^ internal_Cout[3];
                Cout = internal_Cout; // Carry-out is updated

                if (M == 1) begin // Subtraction
                    Sum = ~temp_Sum + 1;
                end else begin // Addition
                    Sum = temp_Sum;
                end
            end
            
            2'b01: begin // Bitwise AND
                Sum = A & B;
                Cout = 4'b0000; // No carry-out in bitwise AND operation
            end
            
            2'b10: begin // Bitwise OR
                Sum = A | B;
                Cout = 4'b0000; // No carry-out in bitwise OR operation
            end
            
            2'b11: begin // Bitwise NOT
                Sum = ~A;
                Cout = ~B;
            end
            
            default: begin
                Sum = 4'b0000;
                Cout = 4'b0000;
            end
        endcase
    end
endmodule
