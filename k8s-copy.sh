for podname in $(kubectl get pods -l env=testing -o custom-columns=:metadata.name | tr -d '\n'); do kubectl cp /k8s-jenkins/files/index.html "${podname}":/usr/local/apache2/htdocs; done

