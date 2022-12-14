# 诗季 -- 诗词移动端学习平台

这是一个诗词 IOS 移动端学习平台，包括如下功能：
- 闯关：四季如诗
- 对战：诗结四海
- 检索：驻足赏诗

## 功能介绍
### 闯关：四季如诗
十二节气为关卡，用户可以通过【吟赏令】或者【拼诗令】完成闯关。

![](./imgs/吟赏令.jpg)
![](./imgs/拼诗令.jpg)

### 对战：诗结四海
好友通过诗词接龙进行比拼，每局有一个主题，对战双方需要轮流说出包含主题的诗句，回答不出的一方输。
![](./imgs/飞花令.jpg)


### 检索：驻足赏诗
用户可以对喜欢的诗歌进行检索查阅，界面中包括详细的讲解，以及其他用户的评论。
![](./imgs/检索.jpg)
![](./imgs/检索2.jpg)

## 技术介绍
### 前端
本项目是采用swift编写iOS平台的App，前端采用MVC的架构，分为Model, View, Controller。
- Model负责封装数据、存储和处理数据运算
- View负责数据的展示、监听用户手势等UI动作，还有响应用户action对应的事件，同时view还负责设置代理和数据源来通知Controller做出响应
- Controller负责业务逻辑、事件响应、数据加工等工作，我们使用了第三方库来进行网络请求，然后通过Notification来接收Model的变化，同时通过KVO监听Model属性的变化来触发响应事件

### 后端

后端采用的是三层客户机/服务器结构，整体分为表现层（UI）、业务逻辑层（BLL）和数据访问层（DAL）

表现层就是前端的交互界面

业务逻辑层以Spring boot作为后端框架，使用了JPA（Java Persistence API）作为ORM框架，我们不使用原生的SQL语句，而是使用JPA提供的Model类及Repertory来实现数据库的增删改查。同时JPA会根据Model类自动生成对应的数据库表。我们还使用了hibernate来进行数据库的访问。

数据访问层，使用mysql来存储基本信息。

## 视频
![./video/demo.mov](./video/demo.mov)

## 合作
林程、林琳
