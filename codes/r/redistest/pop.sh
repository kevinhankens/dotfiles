#!/bin/bash
echo "#!/bin/bash"
for COUNTER in `seq 1 10000`;
  do
    t=$(($COUNTER + 1354885238))
    s="\"incr benjamin:$t\\\r\\\n\""
    echo "(echo -en $s) | nc localhost 6379"
  done
