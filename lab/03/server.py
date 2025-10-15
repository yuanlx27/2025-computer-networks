import socket
import threading

ADDRESS = ("0.0.0.0", 12000)


def handle_client(connectionSocket, address):
    print(f"[连接建立] 客户端 {address} 已连接")
    try:
        while True:
            data = connectionSocket.recv(1024)
            if not data:
                break
            message = data.decode()
            print(f"[来自 {address} 的消息] {message}")
    finally:
        print(f"[连接断开] 客户端 {address} 已断开连接")
        connectionSocket.close()


def main():
    serverSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    serverSocket.bind(ADDRESS)
    serverSocket.listen(1)
    print("[服务器启动] 等待客户端连接...")

    while True:
        connectionSocket, address = serverSocket.accept()
        thread = threading.Thread(target=handle_client, args=(connectionSocket, address))
        thread.daemon = True
        thread.start()


if __name__ == "__main__":
    main()
