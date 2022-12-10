# openssl Encrypt/Decrypt files & streams from the command line

Assuming these bash/shell aliases:

```
export CIPHER=aes-256-cbc
alias enc_stream="gzip -f | openssl enc -${CIPHER} -salt -a"
alias dec_stream="openssl enc -d -${CIPHER} -salt -a | gunzip - "
```

## Examples:

```
$ echo "batman" > batman.txt
$ cat batman.txt
batman

```

### Encrypt a file/stream:

```
$ cat batman.txt | enc_stream
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
U2FsdGVkX19xGn8WuYAV2d5IMNXIMcCGJxBSHRmBhWGDZkLzAI1TKnG/qipy9h8f

cat batman.txt | enc_stream > batman.txt.enc
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:

$ cat batman.txt
batman

$ cat batman.txt.enc
U2FsdGVkX19BROm4cTAiCoBx3uY5wcYt6C2Vch4bvudki62fjHctr1bQ8T50Iqwi
```

### Decrypt a file/stream:

```
cat batman.txt.enc | dec_stream
enter aes-256-cbc decryption password:
batman
```
