# Basic-Memory-Project

before going to open any file, know what the design and tb will do.
understand the input and output pins and why we using it

Design Overview (memory)

The memory module supports synchronous read and write operations with handshaking signals. 
Features: 
Parameters: 
W: Data width (e.g., 16 bits). 
D: Memory depth (e.g., 511 entries). 
AD: Address width for indexing memory. 
Inputs: 
clk_i: Clock signal. 
rst_i: Synchronous reset. 
addr_i: Address of the memory location to access. 
write_i: Data to write into memory. 
wr_rd_i: Indicates the operation type: 1 → Write. 0 → Read. 
valid_i: Handshaking signal to start a transaction. 
Outputs: 
read_o: Data read from memory. 
ready_o: Handshaking signal indicating the memory's readiness. 
Functionality: 
Write Operation: If wr_rd_i == 1 and valid_i == 1, the memory writes write_i to the location addr_i. 
Read Operation: If wr_rd_i == 0 and valid_i == 1, the memory outputs the data at addr_i to read_o. 
Reset: Clears the memory and resets outputs.

Testbench Overview (tb)
The testbench is comprehensive and includes a variety of scenarios to verify the memory module's functionality.

Key Components:

Clock Generation:
The clock toggles every 5 time units (#5), simulating a 10-time-unit clock cycle.
Reset:
Resets the design and initializes signals.
Parameterized Test Cases:
Controlled via $value$plusargs to specify the test type.
Covers a wide range of scenarios such as:
Writing/reading single locations.
Writing/reading all memory locations.
Randomized or quarter-specific memory access.
Concurrent and consecutive operations.
Handshaking Logic:
Ensures that write or read transactions are initiated only when ready_o is high.
Tasks in the Testbench:
fd_write and fd_read: Perform front-door access to write and read data using the valid_i signal.
bd_write and bd_read: Perform back-door access to directly initialize or read memory using $readmemh and $writememh.
consec_wr_rd: Writes to and immediately reads from a memory location consecutively.
concu_wr_rd: Performs concurrent write and read operations on a memory location using a fork-join block.


for more read the document.
