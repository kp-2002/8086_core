module 8086_core_top(
	input         clk,
	//clock
	input         rst,
	//reset
	input         int_rq,
	//interrupt request
	input         min_max_n,
	//selects the mode of operation of the processor: minimum mode when high and maximum mode when low
	input         test_n,
	//active low input that causes the processor to resume execution after the execution of the "WAIT" instruction
	input         ready,
	//active low input used by slow peripherals or memory to acknowledge the completion of a data transfer
	inout         nmi,
	inout         min_hold_max_bus_rq_ack_n_0,
	//Minimum mode: input signal from bus masters that requests control of bus
	//Maximum mode: bus request when low, acknowledge when high (higher priority)
	inout         min_hold_ack_max_bus_rq_ack_1,
	//Minimum mode: asserted high by processor to accept hold
	//Maximum mode: bus request when low, acknowledge when high (higher priority)
	inout  [15:0] addr_data,
	//lower order address bus multiplexed with data
	output [3:0]  addr_status_n,
	//higher order address bus multiplexed with status signals
	output        status_7_bus_high_en_n,
	//acts as status signal S7 when high and enables higher data byte when low, used for connecting the device to 8 bit devices
	output        rd_n,
	//active low signal used for read operation
	output        min_wr_n_max_lock_n,
	//Minimum mode: active low signal used for write operation
	//Maximum mode: active low signal that locks other masters from gaining control of the bus 
	output        min_mem_io_n_max_status_n_2,
	//Minimum mode: memory access when high, i/o access when low
	//Maximum mode: active low status signal S2
	output        min_data_tx_rx_n_max_status_n_1,
	//Minimum mode: data is transmitted when high, received when low
	//Maximum mode: active low status signal S1
	output        min_data_en_n_max_status_n_0,
	//Minimum mode: active low signal that enables data tx/rx
	//Maximum mode: active low status signal S0
	output        min_intr_ack_n_max_q_status_1,
	//Minimum mode: active low signal used to acknowledge interrupt
	//Maximum mode: queue status signal QS1
	output        min_addr_latch_en_max_q_status_0
	//Minimum mode: demultiplexes address and data lines with external latches
	//Maximum mode: queue status signal QS0
	);



endmodule
