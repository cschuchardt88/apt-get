# The Neo Project Test Linux Archive Repo
This repo is for testing.

## Add Repo to `app-get`

**Add the Content Below**
```bash
wget -qO - https://archive.neo.evnts/ubuntu/neo-events.pubkey.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://archive.neo.evnts/ubuntu stable main" | sudo tee /etc/apt/sources.list.d/neoevents.list
```
