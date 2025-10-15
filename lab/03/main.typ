#import "@local/sysu-templates:0.1.0": report

#show: report.with(
  title: "实验三",
  subtitle: "计算机网络实验报告",
  student: (name: "元朗曦", id: "23336294"),
  institude: "计算机学院",
  major: "计算机科学与技术",
  class: "计八",
)

= 实验环境

- 编程语言：Python 3.13.7

= 实验内容

- 使用 TCP 协议创建一个客户端-服务器聊天程序。

- 服务器能够接受多个客户端连接（不少于 5 个）。

- 当有一个新的客户与服务器建立连接，服务器端显示该客户的地址和端口号。

- 当有一个客户与服务器断开连接，服务器端显示该客户的地址和端口号。

- 当有一个客户向服务器发送消息，服务器显示来自该客户的信息。

服务器实现（细节见注释）：

#raw(block: true, lang: "python", read("assets/server.py"))

客户端实现（细节见注释）：

#raw(block: true, lang: "python", read("assets/client.py"))

运行结果如 @fig-1 所示。

#figure(
  caption: "聊天程序运行结果",
  image(width: 80%, "assets/images/20251015-065324.png")
) <fig-1>
