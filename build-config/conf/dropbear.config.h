#ifndef DROPBEAR_LOCAL_OPTIONS_H_
#define DROPBEAR_LOCAL_OPTIONS_H_

#define NON_INETD_MODE 1
#define INETD_MODE 0 /* -- ONIE not set */

#define DROPBEAR_SMALL_CODE 0

#define ENABLE_X11FWD 0 /* -- ONIE not set */

#define DROPBEAR_CLI_LOCALTCPFWD 1
#define DROPBEAR_CLI_REMOTETCPFWD 1

#define DROPBEAR_SVR_LOCALTCPFWD 1
#define DROPBEAR_SVR_REMOTETCPFWD 1

#define DROPBEAR_SVR_AGENTFWD 1
#define DROPBEAR_CLI_AGENTFWD 1

#define DROPBEAR_CLI_PROXYCMD 1
#define DROPBEAR_CLI_NETCAT 1

#define DROPBEAR_USER_ALGO_LIST 1
#define DROPBEAR_AES256 1
#define DROPBEAR_AES128 1
#define DROPBEAR_3DES 0
#define DROPBEAR_TWOFISH256 0
#define DROPBEAR_TWOFISH128 0
#define DROPBEAR_CHACHA20POLY1305 1

#define DROPBEAR_ENABLE_CTR_MODE 1
#define DROPBEAR_ENABLE_CBC_MODE 0
#define DROPBEAR_ENABLE_GCM_MODE 1

#define DROPBEAR_SHA1_HMAC 0
#define DROPBEAR_SHA1_96_HMAC 0
#define DROPBEAR_SHA2_256_HMAC 1
#define DROPBEAR_SHA2_512_HMAC 1
#define DROPBEAR_MD5_HMAC 0

#define DROPBEAR_RSA 1
#define DROPBEAR_DSS 0
#define DROPBEAR_ECDSA 1
#define DROPBEAR_ED25519 1

#define DROPBEAR_DEFAULT_RSA_SIZE 2048

#define DROPBEAR_DH_GROUP14_SHA1 0
#define DROPBEAR_DH_GROUP14_SHA256 1
#define DROPBEAR_DH_GROUP16 1
#define DROPBEAR_CURVE25519 1
#define DROPBEAR_ECDH 1
#define DROPBEAR_DH_GROUP1 0

#define DROPBEAR_SVR_PASSWORD_AUTH 1
#define DROPBEAR_SVR_PUBKEY_AUTH 1
#define DROPBEAR_SVR_PUBKEY_OPTIONS 1

#define DROPBEAR_CLI_PASSWORD_AUTH 1
#define DROPBEAR_CLI_PUBKEY_AUTH 1
#define DROPBEAR_CLI_INTERACT_AUTH 1

#define DROPBEAR_USE_PASSWORD_ENV 0 /* -- ONIE not set */

#define DROPBEAR_URANDOM_DEV "/dev/urandom"

#define DROPBEAR_SFTPSERVER 0 /* -- ONIE not set */

#endif /* DROPBEAR_LOCAL_OPTIONS_H_ */
