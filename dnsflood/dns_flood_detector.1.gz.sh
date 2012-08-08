#!/bin/bash
# george's bundle 0.9.3 self-extracting archive.
# Usage: "sh thisscript", or "sh thisscript /install/to/this/dir"
if ! test -x "`which base64`"; then
  echo 'Sorry, no base64 executable was found.' >&2
  echo 'We need this in order to continue.' >&2
  exit 1
fi
dir=${1-.}
if [[ -d "$dir" ]]; then
  echo "directory $dir exists, starting extraction..."
elif [[ -r "$dir" ]]; then
  echo "$dir is a file, but needs to be a folder."
  exit 1
else
  echo "creating directory $dir ..."
  install -dm755 "$dir"
fi
integerr=0
# START FILE -- `./dns_flood_detector.1.gz`
if test -d "$dir/."; then echo "$dir/." exists ...; file='./dns_flood_detector.1.gz'; elif test -r "$dir/."; then echo "$dir/." is a file, but needs to be a folder; exit 1; else echo creating $dir/.; mkdir -p $dir/.; file='./dns_flood_detector.1.gz'; fi
echo extracting $dir/$file ...
base64 -d << EOF > "$dir/$file"
H4sICA9YVT8AA2Ruc19mbG9vZF9kZXRlY3Rvci4xAK1UYW8aORD97l8x4tOdFByWQq6HqqjcJb0gtQsKVLqKosq7O7BWvLa79kL4
9zf2Jhsu4qRKVwlh433z/ObNY/nqDgrtvm2VMcW3Aj3m3tSQQG/VoCvE8QKWaD1WGdYwvIDhYPCmB72/0s+XH6VuHmnfY3x5B+n0
0y07w/S1DwK8MYq+oD0FkTVO7hEaJ3YICveoHBgNpdyV4Gux3coctKjQYb3H2vF4w/JLOl8sZ0vG+B9nNLN1X8K72Ycg5HoD676H
NCyiXQ7t8tguWbEvNyzS3twu/7yfLVazefofxAfhSDmJNBaL/9EGCB3LUYtMIXxvZP4ANTprtEOQVCiUl3oHvgykCGZLdOhOOEL5
VuRSSS88grOi4nCTLuFDkAw3z65TtQMlM5sLC78QtTa6b2tTSZc3pnFQmQJ/DWyV0TJUSJ3TU7qcDCBpWEtioOfi5HYOK1IWh1mJ
I2QIdaODcFIZxPqDicTuAlBSEzUUAumCeAh0SS+TunBa2F484jDTp5CL2HnkP0ilQChRV7CXAtzRKbOL+GeKkwrqlhogf4OtpHmH
HjSKul+jUH0vK3KK/IrDaYcVGpNFkF6ZGsNAhVRhuLVpiMSVxoRJ8DYi85iOJeOrBeMzOMkZMGcxl9sjYOhX08WUFJljdC1co6Tz
GBzqqimXrO1MeLhOO7MtNeEwN7rooJRdRgEh1qeCrSdQ+gRzHY7CzXKh8kbFVMReKY718Qz2MWDJGAKmkDX5AxK4e5qxp5FuyZcd
uaGjS/8yvQMXz+BM5A8v4JOJdtA9IzmZCaFuvG089GPCxU60d7VzaDHSH7u6khXSWUVpK1FZYidsJbwkP+Nobv+eflp8vA3/3Msz
b5/+Pn4ycj0ZMLZOxpNkNBlfbcCZpqYxrZPfhzy5essTPhpvSNUAvlsKfm5hAsNR/NEUFtZv43ZKL4/kKm4Xq/vNecYBH/DhiA9f
0yXjF7qn/fSZYjwZ/GRRrxh/SNTotajkR0W9eWH57UXUuBMFcVrTz6u7+T27Qa3p7zq3FBsZRveuMHH/XhTGU0A4vYuuofTeTi4v
D4cDPzkPY45T5qWvFGP/AAKcue7CBgAA
EOF
echo setting permissions on $dir/$file to 644 ...
chmod 644 "$dir/$file"
echo -n checking $dir/$file file integrity \(md5sum\) ...\ 
filesum=$(md5sum -b "$dir/$file" | awk '{printf $1}')
if [ "$filesum" == "e8f18181051026f1cfbc582fff918426" ]; then echo looks like $dir/$file is ok.; else echo looks like $dir/$file is corrupted.; let integerr=$integerr+1; fi
# 
# END FILE -- `./dns_flood_detector.1.gz`

echo 
echo Extraction complete.
echo File verification errors: $integerr 
