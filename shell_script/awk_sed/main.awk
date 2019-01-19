#awk 调用系统命令示例
{
	cmd="sed 's/action/"$1"/g; s/operation/"$2"/g' sql.txt >> temp.txt";
	print cmd;
	system(cmd)
}
