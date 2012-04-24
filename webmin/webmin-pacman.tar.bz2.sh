#!/bin/bash
# george's bundle 0.9.1 self-extracting archive.
# Usage: `thisscript', or `thisscript /install/to/this/dir'
if ! test -x "`which base64`"; then echo Sorry, no base64 executable was found. >&2; echo We need this in order to continue. >&2; exit 1; fi
dir=${1-.}
if test -d "$dir"; then echo directory \'$dir\' exists, starting extraction...; elif test -r "$dir"; then echo $dir is a file, but needs to be a folder; exit 1; else echo creating directory \'$dir\' ...; mkdir -p "$dir"; fi
# This script will use 'tar -xjf' to extract files. You must have this program installed.
integerr=0
# START FILE -- `./webmin-pacman.tar.bz2`
if test -d "$dir/."; then echo "$dir/." exists ...; file='./webmin-pacman.tar.bz2'; elif test -r "$dir/."; then echo "$dir/." is a file, but needs to be a folder; exit 1; else echo creating $dir/.; mkdir -p $dir/.; file='./webmin-pacman.tar.bz2'; fi
echo extracting $dir/$file ...
base64 -d << EOF > "$dir/$file"
QlpoOTFBWSZTWZKzwuYAB3L/h9KQAQBAE//mLAo4AH/v36ACWU4RRg4ACFADveTbIA2oNgkiRGiPUPTSNPUNpPUAaNAG1AA9GkOa
YmTJowmCYmmATAIYIwIwHNMTJk0YTBMTTAJgEMEYEYBFJBpGJ6UTbU1PKNAGg0aZHlA0AAJEEFCppiPKeRPJDR6IyD1BpoaBgj/d
Qp0IdZHPKBoZAmsmk0SIgXASXmIg+s3YIK4oASObW4+SOfo6Li7kddORxYhEjSQ7Y5kozcRF1gwSWW3DJrB8czbp0xANAKZikCA5
NQJKFlEEQwwNKRk0Y27p1+LznDR0+75hgQOoUoKbxSz2rWCYoijDtTUR7tSTpSDJYTbpMA8o0RETqEK3yMM0bxw58aJZ0pcwHj4i
R3ju/KdfN24GM55pw84zEWZywSETa9zjgwBLZhp718qswFLVoykiYwLIBS6AFOUU8vPAEEREJ6uisFOZvwJSPrgERRuOCQTNlCUS
IICTkRaEWzuY+Gm3XZsSIEHA12CDRrjJJE2cCp0JD00I08HA1TNFGjGWPLd1k4scGH5KCRBG52NkwTsudmTKWGQT0ElZWGjJwqhv
ZsksZuwosYxlBKZBnVCRQhFQ3MowyE4t4wQZFkEWJEAVjvkTWxziHOSN2bGUREkDp4SyIGFFkIJoqFAJcgRBNFMvJqqwMxYchjBZ
YXwpPZmGcbVCRZvGmcpnQ6sk2GhJgwznJZ3DYInQzUOwOMOJFJkMQZxCORHmgrOFTqQdLwECMhTgKbzv9Uzee8Ug0Cm+mltCqwVP
BKDCqQiSVK8YI7l1EQqzLsOMTS5XhfZo7jnWKQXvbdAZmbMUvQ4m70ouRa8qJxIX7EzDHB1CbBTpRLjMUwKpcIo6xvQm4NgliajZ
ecCst1t3CIh5KrjaGXJnQBMRSurWJaT0oUFIEbakXm67CYpjbiYIspPGbmpD2LGVDAUwSjdQU3JMycthqZNwpZMUrEiRdfUQPv2c
hIytKiRI7Q7pS6kzb0SAoAwRTiKhIuksSM4kViReJi/mxaLfb5ts0fsUkNL2WWabdWqdcWal2ZYxAL/F3JFOFCQkrPC5gA==
EOF
echo setting permissions on $dir/$file to 644 ...
chmod 644 "$dir/$file"
echo -n checking $dir/$file file integrity \(md5sum\) ...\ 
filesum=$(md5sum -b "$dir/$file" | awk '{printf $1}')
if [ "$filesum" == "c86518037449e0fc0c60fc24537ea038" ]; then echo looks like $dir/$file is ok.; else echo looks like $dir/$file is corrupted.; let integerr=$integerr+1; fi
echo unzipping $file with \'tar -xjf\'; owd="$(pwd)"; cd "$dir"; tar -xjf "./$file"; echo removing $file ...; rm "./$file"; cd "$owd"
# END FILE -- `./webmin-pacman.tar.bz2`

echo 
echo Extraction complete.
echo File verification errors: $integerr 
