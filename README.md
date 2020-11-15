# sofa-jraft-jepsen

使用docker测试 sofa-jraft-jepsen

```
#生成密钥对
ssh-keygen -t rsa -m PEM 
cat id_rsa.pub > authorized_keys
docker build -t jepsen:0.0.1 .
docker network created jepsen
sh start_node.sh
docker exec -it client /bin/bash
```
后面参照sofa-jraft-jepsen说明使用 可能需要设置http_proxy