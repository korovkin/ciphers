export CIPHER=aes-256-cbc
alias enc_stream="gzip -f | openssl enc -${CIPHER} -salt -a"
alias dec_stream="openssl enc -d -${CIPHER} -salt -a | gunzip - "
