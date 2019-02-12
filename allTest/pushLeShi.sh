SOURCE=/home/nvenc/Videos/Test
#XunLei
#DEST=rtmp://netease.push.test.live.00cdn.com/live

#WangSu
#DEST=rtmp://t.live.126.net/10018

#LeShi
DEST=rtmp://lstestp.live.126.net/neteaselive

#DiLian
#DEST=rtmp://pushwy.dnion.com/wangyi/
array_moviefile=(
"${SOURCE}/bbc_640x360_500kb.flv"
"${SOURCE}/chase_960x540_902kb.flv"
"${SOURCE}/chase_1280x720_1595k.flv"
"${SOURCE}/meru_1280x720_2506kb.flv"
"${SOURCE}/meru_1920x1080_5134kb.flv")

array_pushurl=(
"${DEST}/hznetease360"
"${DEST}/hznetease480"
"${DEST}/hznetease720"
"${DEST}/hznetease7203"
"${DEST}/hznetease1080")

#第一个参数movie文件地址，第二个参数推流
function pushStreamFun() {
#无线循环
while test "1"="1"
do
now=`date +%M`
mytime="00"
if [ $now  == $mytime ]
then
echo $1"----"$2
echo $now"--"$mytime
/home/nvenc/Downloads/ffmpeg-2.8.1-64bit-static/ffmpeg -re -i $1 -codec copy -f flv $2;
else
echo "not 00,now is "$now
sleep 10
fi
# /home/nvenc/Downloads/ffmpeg-2.8.1-64bit-static/ffmpeg -re -i $1 -codec copy -f flv $2;

done
}
{
pushStreamFun ${array_moviefile[0]} ${array_pushurl[0]}
}&
{
pushStreamFun ${array_moviefile[1]} ${array_pushurl[1]}
}&
{
pushStreamFun ${array_moviefile[2]} ${array_pushurl[2]}
}&
{
pushStreamFun ${array_moviefile[3]} ${array_pushurl[3]}
}&
{
pushStreamFun ${array_moviefile[4]} ${array_pushurl[4]}
}&