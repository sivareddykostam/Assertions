all:
	make compile; make simulate

compile:
	vlib work; vlog -sv file.sv 

simulate:
	vsim -novopt work.top work.sva_svtb -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf
