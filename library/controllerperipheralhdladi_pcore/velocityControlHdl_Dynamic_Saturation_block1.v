// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\velocityControlHdl\velocityControlHdl_Dynamic_Saturation_block1.v
// Created: 2014-08-25 21:11:09
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: velocityControlHdl_Dynamic_Saturation_block1
// Source Path: velocityControlHdl/Control_Velocity/Rotor_Velocity_Control/PI_Sat/Dynamic Saturation
// Hierarchy Level: 7
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module velocityControlHdl_Dynamic_Saturation_block1
          (
           up,
           u,
           lo,
           y,
           sat_mode
          );


  input   signed [17:0] up;  // sfix18_En15
  input   signed [35:0] u;  // sfix36_En22
  input   signed [17:0] lo;  // sfix18_En15
  output  signed [35:0] y;  // sfix36_En22
  output  sat_mode;


  wire signed [35:0] LowerRelop1_1_cast;  // sfix36_En22
  wire LowerRelop1_relop1;
  wire signed [35:0] UpperRelop_1_cast;  // sfix36_En22
  wire UpperRelop_relop1;
  wire signed [35:0] lo_dtc;  // sfix36_En22
  wire signed [35:0] Switch_out1;  // sfix36_En22
  wire signed [35:0] up_dtc;  // sfix36_En22
  wire signed [35:0] Switch2_out1;  // sfix36_En22
  wire LowerRelop1_out1;


  // <S33>/LowerRelop1
  assign LowerRelop1_1_cast = {{11{up[17]}}, {up, 7'b0000000}};
  assign LowerRelop1_relop1 = (u > LowerRelop1_1_cast ? 1'b1 :
              1'b0);



  // <S33>/UpperRelop
  assign UpperRelop_1_cast = {{11{lo[17]}}, {lo, 7'b0000000}};
  assign UpperRelop_relop1 = (u < UpperRelop_1_cast ? 1'b1 :
              1'b0);



  assign lo_dtc = {{11{lo[17]}}, {lo, 7'b0000000}};



  // <S33>/Switch
  assign Switch_out1 = (UpperRelop_relop1 == 1'b0 ? u :
              lo_dtc);



  assign up_dtc = {{11{up[17]}}, {up, 7'b0000000}};



  // <S33>/Switch2
  assign Switch2_out1 = (LowerRelop1_relop1 == 1'b0 ? Switch_out1 :
              up_dtc);



  assign y = Switch2_out1;

  // <S33>/Logical Operator
  assign LowerRelop1_out1 = LowerRelop1_relop1 | UpperRelop_relop1;



  assign sat_mode = LowerRelop1_out1;

endmodule  // velocityControlHdl_Dynamic_Saturation_block1

