import socket

ADDRESS = ("127.0.0.1", 12000)


def main():
    # 初始化客户端
    clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    clientSocket.connect(ADDRESS)
    print("[连接到服务器] 你可以开始发送消息了 (输入 exit 退出)")
    try:
        while True:
            # 向服务器发送消息
            message = input("你：")
            if message.strip().lower() == "exit":
                print("[断开连接] 客户端已断开连接")
                break
            clientSocket.send(message.encode())
    finally:
        clientSocket.close()


if __name__ == "__main__":
    main()
