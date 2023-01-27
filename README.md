# kasmweb-plus

## Create OCI Container Instances

VNC_PW: at least 8 characters
MINIO_ROOT_USER: at least 8 characters
MINIO_ROOT_PASSWORD: at least 8 characters

## Access oracle-8-desktop

url: https://HOST_IP:6901
username: kasm_user
password: $VNC_PW (default: vncpassword)

## Access Minio

url: http://HOST_IP:9001
username: $MINIO_ROOT_USER (default: kasm_user)
password: $MINIO_ROOT_PASSWORD (default: vncpassword)

## Access alist
url: http://HOST_IP:5244
username: shown by execute `sudo alist admin`
password: shown by execute `sudo alist admin`

### Mount Local File System
驱动: 本机存储
挂载路径: /local_files
根文件夹路径: /

### Mount OCI Object Storage
驱动: 对象存储
挂载路径: /oci_objectstorage
根文件夹路径: /
存储桶: /<your_oci_bucket>
Endpoint: https://<your_oci_objectstorage_namespace>.compat.objectstorage.<oci_region>.oraclecloud.com/
地区: <oci_region>
访问密钥 Id: <your_oci_access_key>
安全访问密钥: <your_oci_secret_key>

### Mount Minio Object Storage
驱动: 对象存储
挂载路径: /minio_objectstorage
根文件夹路径: /
存储桶: /<your_minio_bucket>
Endpoint: http://<your_ip>:9000
访问密钥 Id: <your_minio_access_key>
安全访问密钥: <your_minio_secret_key>
