# tosoai-pipline

## Deploy

```sh
chmod +x /opt/tsoai/deploy.sh
```

## Service

```sh
cp tsoai-pipeline/system/* /etc/systemd/system
```

### Timer

```sh
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

sudo systemctl enable --now tsoai-deploy.timer
```

#### Test Timer

```sh
sudo systemctl start tsoai-deploy.service
journalctl -u tsoai-deploy.service --no-pager --since "10 minutes ago"
systemctl list-timers | grep tsoai
```
