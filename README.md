# NOR-image-builder
NOR Image build

常常需要订做NOR Image FW
NOR Image通常格式如下：（举一个例子）

#地址     文件名

0x0        slb1_nor.mbn

0x50000   norplusnand-system-partition-ipq807x.bin

......    .........

做一个shell脚本，在对应的位置上放相应的文件内容
其他地方补上0xFF即可。
