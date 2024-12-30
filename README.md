# 教务管理系统

#### 项目介绍
{**基本情况**
本项目是基于数据库课程设计进行的一个实践}

#### 软件架构
## 项目环境
**java版本：** jdk-17。  
**后端**
springbot，maven，javaweb（pom.xml文件中配有）。  
**前端**
vue2，elementUI，axios。  
**数据库**
mysql（使用可视化Navigate进行管理）。


#### 安装教程
## 后端安装
springbot的环境搭建，去官网下载springbot，带上javaweb，mysaql支持
[学习链接](https://www.bilibili.com/video/BV1gm411m7i6/?spm_id_from=333.337.search-card.all.click&vd_source=3f86a82293dfda8ebb84f6cfd509c597)。
或者采用idea专业版进行项目创建。
开放端口8080。

## 前端安装
vue环境搭建
[学习链接（包含了vue,elementui，axios）](https://www.bilibili.com/video/BV1NY4y1G78b?spm_id_from=333.788.videopod.sections&vd_source=3f86a82293dfda8ebb84f6cfd509c597)， 
[elementUI官网](https://element.eleme.cn/#/zh-CN/component/quickstart)。  
使用npm下载前端打印组件库。  
npm install vue-print-nb --save。
开放端口9902 。

## 注意
使用时需要更改后端的数据库密码等配置。文件位置为application.properties。
并在mysql数据库中建立teaching-manager数据库。


#### 使用说明

1.  前端文件位置vue01中。可以在终端中cd vue01.并使用npm run serve 开启项目。
2.  千万别忘记下载前端打印库！！！

#### 项目结构图
![ER图](%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E5%9B%BE/ER.png)】
![关系模式图](%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E5%9B%BE/%E5%85%B3%E7%B3%BB%E6%A8%A1%E5%BC%8F.png)
![物理结构图](%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E5%9B%BE/%E7%89%A9%E7%90%86%E7%BB%93%E6%9E%84%E5%9B%BE.png)
![系统功能图](%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E5%9B%BE/%E7%B3%BB%E7%BB%9F%E5%8A%9F%E8%83%BD%E5%9B%BE.jpg)
![系统流程图](%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E5%9B%BE/%E7%B3%BB%E7%BB%9F%E6%B5%81%E7%A8%8B%E5%9B%BE.jpg)
#### 特别鸣谢
[B站up：边城仔](https://www.bilibili.com/video/BV1zc41167dA/?spm_id_from=333.337.search-card.all.click&vd_source=3f86a82293dfda8ebb84f6cfd509c597
)


