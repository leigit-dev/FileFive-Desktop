import webview
import subprocess
import os
import sys
import time
import urllib.request

node_process = None

def is_server_ready(url, timeout=0.5):
    try:
        req = urllib.request.Request(url, method='HEAD')
        with urllib.request.urlopen(req, timeout=timeout) as response:
            return True
    except Exception:
        return False

def start_server():
    global node_process
    
    if getattr(sys, 'frozen', False):
        base_dir = sys._MEIPASS
    else:
        base_dir = os.path.dirname(os.path.abspath(__file__))

    node_exe = os.path.join(base_dir, 'node.exe')
    cli_path = os.path.join(base_dir, 'node_modules', 'filefive', 'dist', 'index.js')

    if not os.path.exists(node_exe) or not os.path.exists(cli_path):
        raise FileNotFoundError("缺少 node.exe 或 node_modules，请先运行 build.bat 进行构建。")

    env = os.environ.copy()
    env['NODE_ENV'] = 'development' 

    node_process = subprocess.Popen(
        [node_exe, cli_path],
        env=env,
        cwd=base_dir,
        creationflags=subprocess.CREATE_NO_WINDOW,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )

    url = 'http://localhost:3113'
    start_time = time.time()
    while time.time() - start_time < 10:
        if is_server_ready(url):
            return True
        time.sleep(0.5)
    
    raise TimeoutError("后台服务启动超时，端口可能被占用。")

def on_closed():
    global node_process
    if node_process:
        node_process.kill() 
        node_process = None

def main():
    try:
        start_server()
        window = webview.create_window(
            title='FileFive Desktop',
            url='http://localhost:3113',
            width=1200,
            height=800
        )
        window.events.closed += on_closed
        webview.start()
    except Exception as e:
        # 抛出错误给系统处理，静默失败
        raise e

if __name__ == '__main__':
    main()