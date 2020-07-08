port=$(sudo kubectl get service -l env=testing | cut -d " " -f 15 | cut -d ":" -f 2 | cut -d "/" -f 1 | tr -d '\n')
status=$(sudo curl -o /dev/null -s -w "%{http_code}" http://192.168.99.100:"${port}")
if [[ $status == 200 ]]
then
echo "Ready To Deploy"
else
echo "There is some error"
exit 0
fi
