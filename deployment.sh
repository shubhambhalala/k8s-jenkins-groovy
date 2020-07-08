sudo cp /jenkins-groovy/files/testing.yml /jenkins-groovy/files/deployment.yml
sudo sed -i 's/testing/production/g' /jenkins-groovy/files/deployment.yml
sudo sed -i 's/myweb/mywebprod/g' /jenkins-groovy/files/deployment.yml
sudo sed -i 's/claimName: mywebprod-pv-claim/claimName: myweb-pv-claim/g' /jenkins-groovy/files/deployment.yml
#sudo sed -i '/---/,/---/d' /k8s-jenkins/files/deployment.yml
sudo kubectl create -f /jenkins-groovy/files/deployment.yml


#podname=$(kubectl get pods -l env=production -o custom-columns=:metadata.name | tr -d '\n') 

#sudo kubectl cp /jenkins-groovy/files/index.html "${podname}":/usr/local/apache2/htdocs

port=$(sudo kubectl get service -l env=production | cut -d " " -f 15 | cut -d ":" -f 2 | cut -d "/" -f 1 | tr -d '\n')
#status=$(sudo curl -o /dev/null -s -w "%{http_code}" http://192.168.99.100:"${port}")
export DISPLAY=:0
sleep 10
sudo firefox http://192.168.99.100:"${port}"
