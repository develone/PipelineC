#pragma once
#include "type_bytes_t.h/int8_t_bytes_t.h/int8_t_bytes.h"
#define work_inputs_t_SIZE 8

void work_inputs_t_to_bytes(work_inputs_t* x, uint8_t* bytes)
{
size_t pos = 0;
// matrix0
size_t matrix0_dim_0;
for(matrix0_dim_0=0;matrix0_dim_0<2;matrix0_dim_0=matrix0_dim_0+1){
size_t matrix0_dim_1;
for(matrix0_dim_1=0;matrix0_dim_1<2;matrix0_dim_1=matrix0_dim_1+1){
 int8_t_to_bytes(&(x->matrix0[matrix0_dim_0][matrix0_dim_1]), &(bytes[pos]));
 pos = pos + 1; // not sizeof()
}
}
// matrix1
size_t matrix1_dim_0;
for(matrix1_dim_0=0;matrix1_dim_0<2;matrix1_dim_0=matrix1_dim_0+1){
size_t matrix1_dim_1;
for(matrix1_dim_1=0;matrix1_dim_1<2;matrix1_dim_1=matrix1_dim_1+1){
 int8_t_to_bytes(&(x->matrix1[matrix1_dim_0][matrix1_dim_1]), &(bytes[pos]));
 pos = pos + 1; // not sizeof()
}
}

}

void bytes_to_work_inputs_t(uint8_t* bytes, work_inputs_t* x)
{
size_t pos = 0;
// matrix0
size_t matrix0_dim_0;
for(matrix0_dim_0=0;matrix0_dim_0<2;matrix0_dim_0=matrix0_dim_0+1){
size_t matrix0_dim_1;
for(matrix0_dim_1=0;matrix0_dim_1<2;matrix0_dim_1=matrix0_dim_1+1){
 bytes_to_int8_t(&(bytes[pos]), &(x->matrix0[matrix0_dim_0][matrix0_dim_1]));
 pos = pos + 1; // not sizeof()
}
}
// matrix1
size_t matrix1_dim_0;
for(matrix1_dim_0=0;matrix1_dim_0<2;matrix1_dim_0=matrix1_dim_0+1){
size_t matrix1_dim_1;
for(matrix1_dim_1=0;matrix1_dim_1<2;matrix1_dim_1=matrix1_dim_1+1){
 bytes_to_int8_t(&(bytes[pos]), &(x->matrix1[matrix1_dim_0][matrix1_dim_1]));
 pos = pos + 1; // not sizeof()
}
}

}
