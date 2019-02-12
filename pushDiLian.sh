#SOUCE="/home/nvenc/Videos/Test"


array_moviefile=("/bbc_640x360_500kb.flv"
				"/home/nvenc/Videos/Test/chase_960x540_902kb.flv"
					"/home/nvenc/Videos/Test/chase_1280x720_1595k.flv"
						"/home/nvenc/Videos/Test/meru_1280x720_2506kb.flv"
							"/home/nvenc/Videos/Test/meru_1920x1080_5134kb.flv")
array_pushurl=(
							"rtmp://pushwy.dnion.com/wangyi/hznetease360"
							"rtmp://pushwy.dnion.com/wangyi/hznetease480"
	"rtmp://pushwy.dnion.com/wangyi/hznetease720"
	"rtmp://pushwy.dnion.com/wangyi/hznetease7203"
	"rtmp://pushwy.dnion.com/wangyi/hznetease1080"
							)
#第一个参数movie文件地址，第二个参数推流
function pushStreamFun() {
	for((i=0;i<5;i++))
		do
				echo "push time "$i
				{
					echo "sleep..."
					sleep 10
				}&
							echo "start"$1"----"$2
#	/home/nvenc/Downloads/ffmpeg-2.8.1-64bit-static/ffmpeg -re -i $1 -codec copy -f flv $2;
				echo "end:"$1"--"$2"--"$i
				echo "=================="
				echo ""
				wait
						done
}
{
	pushStreamFun ${array_moviefile[0]} ${array_pushurl[0]}
}&
{
	pushStreamFun ${array_moviefile[1]} ${array_pushurl[1]}
}&
#{
#	pushStreamFun ${array_moviefile[2]} ${array_pushurl[2]}
#}&
#{
#	pushStreamFun ${array_moviefile[3]} ${array_pushurl[3]}
#}&
#{
#	pushStreamFun ${array_moviefile[4]} ${array_pushurl[4]}
#}&
wait
