#Jlight
####项目简介
Jlight是一款基础权限管理系统，其目标主要是降低从零到一的开发成本、学习共同进步。
####功能简介
-  用户管理
-  角色管理
-  菜单管理
-  字典管理
-  登录日志
-  操作日志



####技术简介
#####后台技术
- spring boot 1.4.2.RELEASE
- apache Shiro 1.3.2
- mybatis 3.4.1
- alibaba Druid 1.0.26
- thymeleaf 2.1.5.RELEASE
- lLogback  1.1.7
- guava 19.0
- ehcache 2.5.3

#####前端
- AngularJS v1.4.6
- bootstrap.js v3.0.0
- Layer弹出层
- bootstrap datetimepicker
- JSTree
- select-mutiple

####部署步骤

######环境要求
JDK1.8+ 、MySQL5.5+、Maven3.3+

######本地部署
- 创建数据库jlight，并执行doc/jlight-init.sql
- 运行jlight-web/com/lew/jlight/web/Application的main函数即可
- 访问路径：http://localhost

######打包部署
- 执行mvn clean package -Pdev(profile参数根据使用环境而定)，执行后在Jlight-web/target目录生成jlight-web-1.0-SNAPSHOT.zip，解压后内容：
config（Jlight配置文件）、lib（相关依赖包）、jlight.sh、start.bat
**（注意：Linux环境下脚本使用：./jlight.sh start|stop|restart|status|info）**

####相关界面