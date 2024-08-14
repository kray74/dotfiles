# Reset GTA 5 online broken session
function gtareset() {
  pkill -STOP -i gta5.exe && sleep 20s && pkill -CONT -i gta5.exe
}
