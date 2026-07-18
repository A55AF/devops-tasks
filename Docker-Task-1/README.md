# Part 1

---

```bash
docker run -d --name alpine_sleeper alpine sleep 1000
docker ps -a
docker stop alpine_sleeper
docker rm alpine_sleeper
docker rmi alpine
```

# Part 2

---

```bash
docker pull ubuntu:latest
docker run -d --name ubuntu-server ubuntu sleep 6767
docker exec ubuntu-server apt update
docker exec -i ubuntu-server apt install curl
docker exec -i ubuntu-server sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'
```

