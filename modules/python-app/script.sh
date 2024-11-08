
sudo docker build -f Dockerfile -t somename:stable ./
sudo docker image tag somename:stable ghcr.io/notlgbt/optimalcitytask:stable 


sudo echo $GITHUB_TOKEN | sudo docker login ghcr.io -u NotLGBT --password-stdin


sudo docker push ghcr.io/notlgbt/optimalcitytask:stable
