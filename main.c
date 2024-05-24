#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

#define BUFFER_SIZE 128
int err(){
    printf("errno %d\n",errno);
    printf("%s\n",strerror(errno));
    exit(1);
}

// 1.1 hexdump
void hexdump(char* filename){
    int r_file = open(filename, O_RDONLY, 0);
    int r_bytes;
    char buff[BUFFER_SIZE];
    while((r_bytes = read(r_file, buff, BUFFER_SIZE)) > 0){
        if(r_bytes == -1){
            err();
        }
        for (int i = 0; i < r_bytes; i++){
            printf("%02x ", (unsigned char)buff[i]);
        }
    }
    printf("\n");
}

// 1.2 encode
void encode(char* textfile, char* keyfile, char* ciphertextfile){
    int text_file = open(textfile, O_RDONLY, 0);
    int key_file = open(keyfile, O_RDONLY, 0);
    int ciphertext_file = open(ciphertextfile, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    int r_bytes;
    int w_bytes;
    char buff[BUFFER_SIZE];
    char key[BUFFER_SIZE];
    int keyLen = read(key_file, key, BUFFER_SIZE);
    if (keyLen == -1) {
        err();
    }
    int keyIndex = 0;
    while((r_bytes = read(text_file, buff, BUFFER_SIZE)) > 0){
        if(r_bytes == -1){
            err();
        }
        for (int i = 0; i < r_bytes; i++){
            buff[i] = buff[i] ^ key[keyIndex % keyLen];
            keyIndex++;
        }
        w_bytes = write(ciphertext_file, buff, r_bytes);
        if(w_bytes == -1){
            err();
        }
    }
    if (r_bytes == -1) {
        err();
    }

    close(text_file);
    close(key_file);
    close(ciphertext_file);
}

// 1.3 decode
void decode(char* ciphertextfile, char* keyfile){
    int key_file = open(keyfile, O_RDONLY, 0);
    int ciphertext_file = open(ciphertextfile, O_RDONLY, 0);
    int r_bytes;
    int w_bytes;
    char buff[BUFFER_SIZE];
    char key[BUFFER_SIZE];
    int keyLen = read(key_file, key, BUFFER_SIZE);
    if (keyLen == -1) {
        err();
    }
    int keyIndex = 0;
    while((r_bytes = read(ciphertext_file, buff, BUFFER_SIZE)) > 0){
        if(r_bytes == -1){
            err();
        }
        for (int i = 0; i < r_bytes; i++){
            buff[i] = buff[i] ^ key[keyIndex % keyLen];
            keyIndex++;
            printf("%c",buff[i]);
        }
    }
    if (r_bytes == -1) {
        err();
    }
    printf("\n");
    close(key_file);
    close(ciphertext_file);
}

int main(int argc,char *argv[]){
    if (argc < 0){
        printf("no arguments provided");
    }
    else if (strcmp(argv[1],"hexdump") == 0){
        hexdump(argv[2]);
    }
    else if (strcmp(argv[1],"encode") == 0){
        encode(argv[2],argv[3],argv[4]);
    }
    else if (strcmp(argv[1],"decode") == 0){
        decode(argv[2],argv[3]);
    }
}