userarr=(tony steve banner)
hostarr=(stapp01 stapp02 stapp03)
#passarr=()

for i in ${!userarr[*]}
  do 
    echo "starting ${userarr[i]}@${hostarr[i]}"
    echo ${passarr[i]} | ssh-copy-id ${userarr[i]}@${hostarr[i]}
  done
