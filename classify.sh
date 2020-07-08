if sudo ls ./*.html
then
sudo kubectl create -f /jenkins-groovy/files/testing.yml
#for podname in $(kubectl get pods -l env=testing -o custom-columns=:metadata.name | tr -d '\n'); do kubectl cp /jenkins-groovy/files/index.html "${podname}":/usr/local/apache2/htdocs; done
sleep 15
sudo sh /root/k8s-copy.sh
elif sudo ls ./*.py
then
sudo kubectl create -f /jenkins-groovy/files/testing.yml
#for podname in $(kubectl get pods -l env=testing -o custom-columns=:metadata.name | tr -d '\n'); do kubectl cp /jenkins-groovy/files/index.html "${podname}":/usr/local/apache2/htdocs; done
sleep 15
sudo sh /root/k8s-copy.sh
elif sudo ls ./*.php
then
sudo kubectl create -f /jenkins-groovy/files/testing.yml
#for podname in $(kubectl get pods -l env=testing -o custom-columns=:metadata.name | tr -d '\n'); do kubectl cp /jenkins-groovy/files/index.html "${podname}":/usr/local/apache2/htdocs; done
sleep 15
sudo sh /root/k8s-copy.sh
fi

