# Real-GUI

### 简单易用的图像分辨率放大软件(基于[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN))

##### 概述

本项目基于可以将低清图像转化为高清图像的项目[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)

提供了对普通用户简单易用的界面

##### 特色

- 一键拖拽式操作
- 支持批量图片及文件夹（单文件,多文件,多文件夹，嵌套的多文件夹）

- 进度条可前台显示或隐藏
- 可有窗口或无窗口模式运行，无窗模式下直接把文件拖到软件图标处即可
- 本项目也可以直接作为[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)项目的用户界面，只需要把Real-GUI.exe放到Real-ESRGAN项目的解压文件夹下即可

##### 用法提要

- 下载[**Real-GUI.zip**](https://github.com/scifx/Real-GUI/releases/download/v1.01/Real-GUI.zip)解压缩，直接双击运行Real-GUI.exe
- 把图片拖拽进软件窗口里即可完成图片清晰度转换
- 放大的新文件将出现在源文件目录下

##### 参数解析

- 放大倍数：把图片放大几倍（2或4）倍
- 格式：图片格式（jpg或png）
- 算法：提供了5种算法模型来控制生成的图像的质量和效果，具体区别可参照源项目[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)
- 后缀名：生成图片后面追加的个性化后缀名
- 后台运行：默认勾选不显示弹窗进度条，取消勾选会显示弹窗和进度（前台运行）。默认勾选的话可以在无窗/命令行下隐藏运行
- 保存：保存设置参数，以便下次在**无窗模式**下运行

##### 注意

- 重新打开软件后会恢复默认参数（为了足够傻瓜）
- 如果需要按新参数转换，可在更改参数后直接把文件拖拽过去窗口即可
- 如果点击保存按钮，当下参数会作为无窗模式下的运行参数

##### 界面预览



<img src="https://raw.githubusercontent.com/scifx/Real-GUI/main/assets/基础.JPG" alt="img"  />

![img](https://raw.githubusercontent.com/scifx/Real-GUI/main/assets/高级.JPG)

##### 软件效果预览

(取自源项目[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN))

![img](https://github.com/xinntao/Real-ESRGAN/raw/master/assets/teaser.jpg)

##### 致谢

这个软件的诞生起源于群友[Leroy](https://www.youtube.com/channel/UCykWxkUl6QoRr3sE7e4GtFg)发现的[Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN)项目。

并且提供了软件的初始使用创意，就是拖拽式，简单粗暴~

虽然命令行下用法也很简单，但这么好的东西不能被普通用户使用有点可惜~

于是花了几天时间弄了个简单的界面，让傻瓜都能用。。。哈哈哈哈

除了这里也可以在B站看使用教程和给我反馈

https://www.bilibili.com/video/BV1SR4y1L7qb

另外感谢源项目的团队，弄了这么好的东西！
