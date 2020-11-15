#! /bin/sh
docker run -d --network jepsen --hostname jraft.host1 --name jraft.host1 --rm --cap-add NET_ADMIN jepsen:0.0.1
docker run -d --network jepsen --hostname jraft.host2 --name jraft.host2 --rm --cap-add NET_ADMIN jepsen:0.0.1
docker run -d --network jepsen --hostname jraft.host3 --name jraft.host3 --rm --cap-add NET_ADMIN jepsen:0.0.1
docker run -d --network jepsen --hostname jraft.host4 --name jraft.host4 --rm --cap-add NET_ADMIN jepsen:0.0.1
docker run -d --network jepsen --hostname jraft.host5 --name jraft.host5 --rm --cap-add NET_ADMIN jepsen:0.0.1
docker run -d --network jepsen --hostname client --name client --rm --cap-add NET_ADMIN jepsen:0.0.1
