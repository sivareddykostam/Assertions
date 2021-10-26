all:
	make clean; make compile; make simulate; vsim -view waveform.wlf

compile:
	vlib work; vlog -sv file.sv 

simulate:
	vsim -novopt work.top work.sva_svtb -c -do "log -r /*; add wave -r /*; run -all;" -wlf waveform.wlf

clean:
	rm -rf work/ transcript vsim.wlf

waveform:
	vsim -view waveform.wlf
