reset

TERM_TYPE='png'
X_SIZE=1500
Y_SIZE=600

set term TERM_TYPE size X_SIZE,Y_SIZE

# if no command line arg for the output filename and title
if (!exists("outfile")) outfile= outdir . 'io-rband.png'
if (!exists("title")) title='IO Read Bandwidth'

set output outfile

set xdata time
set format x "%H:%M:%S" 
set timefmt "%Y-%m-%d %H:%M:%S"

set grid xtics mxtics lc rgb "#bbbbbb" lw 1 lt 0

set key outside left bottom horizontal Right noreverse enhanced autotitle box lc rgb "#bbbbbb" lw 1 lt 1

set title title
set xlabel "Time" 

set ylabel "MB/s read (rMB/s)" 
plot datafile using 1:8 t 'rMB/s sdc'  lc rgb "blue" with line

set ylabel "MB/s write" 
outfile= outdir . 'io-wbad.png'
title='IO Write Throughput'
set output outfile
set title title
plot datafile using 1:9 t 'wMB/s'  lc rgb "blue" with line

set ylabel "avg size (sectors) of reqs issued to the device" 
outfile= outdir . 'io-avgrq-sz.png'
title='IO avgrq-sz'
set output outfile
set title title
plot datafile using 1:10 t 'avgrq-sz'  lc rgb "blue" with line

set ylabel "avg queue length of reqs issued to the device."
outfile= outdir . 'io-avgqu-sz.png'
title='IO avgqu-sz'
set output outfile
set title title
plot datafile using 1:11 t 'avgqu-sz'  lc rgb "blue" with line

set ylabel "avg time (ms) for I/O reqs (incl time in queue and time spent to serv"
outfile= outdir . 'io-await.png'
title='IO await'
set output outfile
set title title
plot datafile using 1:12 t 'await'  lc rgb "blue" with line

set ylabel "avg time (ms) for reads (incl time in queue and time spent to serv)"
outfile= outdir . 'io-r_await.png'
title='IO r_await'
set output outfile
set title title
plot datafile using 1:13 t 'r_await'  lc rgb "blue" with line

set ylabel "avg time (ms) for writes (incl time in queue and time spent to serv)"
outfile= outdir . 'io-w_await.png'
title='IO w_await'
set output outfile
set title title
plot datafile using 1:14 t 'w_await'  lc rgb "blue" with line

outfile= outdir . 'io-svctm.png'
title='IO svctm'
set output outfile
set title title
plot datafile using 1:15 t 'svctm'  lc rgb "blue" with line

set ylabel "%util"
outfile= outdir . 'io-util.png'
title='IO util'
set output outfile
set title title
plot datafile using 1:16 t 'util'  lc rgb "blue" with line

set ylabel "#writes / sec"
outfile= outdir . 'io-ws.png'
title='IO w/s'
set output outfile
set title title
plot datafile using 1:7 t 'w/s'  lc rgb "blue" with line

set ylabel "#reads / sec"
outfile= outdir . 'io-rs.png'
title='IO r/s'
set output outfile
set title title
plot datafile using 1:6 t 'r/s'  lc rgb "blue" with line

set ylabel "num of writes merged per sec queued to the device"
outfile= outdir . 'io-wrqms.png'
title='IO wrqm/s'
set output outfile
set title title
plot datafile using 1:5 t 'wrqm/s'  lc rgb "blue" with line

set ylabel "num of reads merged per sec queued to the device"
outfile= outdir . 'io-rrqms.png'
title='IO rrqm/s'
set output outfile
set title title
plot datafile using 1:4 t 'rrqm/s'  lc rgb "blue" with line

