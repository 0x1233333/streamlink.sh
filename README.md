# streamlink.sh
streamlink转播命令

这个错误提示通常表明系统无法找到你要执行的脚本文件。以下是一些可能的原因及解决方法：

### 1. **确认脚本文件存在**
   - 首先，确保脚本文件 `streamlink_auto_restart.sh` 已经创建并保存在你当前的工作目录中。
   - 你可以使用 `ls` 命令来查看当前目录下的文件：
     ```bash
     ls
     ```
   - 如果文件不在当前目录，可以使用 `cd` 命令导航到脚本所在的目录，或者在保存脚本时指定绝对路径。

### 2. **检查文件名和路径**
   - 确保文件名和路径拼写正确，包括大小写。Linux 是区分大小写的，所以 `streamlink_auto_restart.sh` 与 `Streamlink_auto_restart.sh` 是不同的文件名。

### 3. **赋予执行权限**
   - 如果脚本存在但没有执行权限，需要赋予它执行权限：
     ```bash
     chmod +x streamlink_auto_restart.sh
     ```

### 4. **绝对路径或相对路径**
   - 如果你使用了相对路径 (`./streamlink_auto_restart.sh`)，请确认你当前目录确实包含这个文件。
   - 如果不确定，可以尝试使用脚本的绝对路径：
     ```bash
     /path/to/your/script/streamlink_auto_restart.sh
     ```

### 5. **检查Shell**
   - 确认脚本头部的 `#!/bin/bash` 指定了正确的 Shell。如果没有这行，系统可能无法正确执行脚本。
   - 使用文本编辑器（如 `nano` 或 `vim`）打开脚本，检查是否有这个 shebang 行。

如果你确认了以上步骤后仍然出现错误，可以通过 `cat streamlink_auto_restart.sh` 命令检查脚本内容，并确认它确实是你想要执行的脚本。


这些错误提示表明脚本文件可能存在几个问题：

1. **行尾字符问题**：`$'\r': command not found` 表示脚本中包含了 Windows 风格的换行符（`\r\n`），而 Linux 使用的是 Unix 风格的换行符（`\n`）。这种问题通常发生在 Windows 环境中创建或编辑的脚本文件中。

2. **语法错误**：`Syntax error: end of file unexpected (expecting "do")` 表示脚本文件中存在语法错误，可能是因为行尾字符问题或脚本编写不规范。

### 解决步骤

#### 1. **修复行尾字符**

使用 `dos2unix` 工具将脚本的换行符从 Windows 风格转换为 Unix 风格：

```bash
sudo apt-get install dos2unix
sudo dos2unix /root/streamlink_auto_restart.sh
```

#### 2. **检查和修复脚本内容**

打开脚本文件并检查内容，确保没有语法错误。可以使用 `nano` 编辑器检查脚本：

```bash
sudo nano /root/streamlink_auto_restart.sh
```

确保脚本内容符合正确的 Bash 语法。例如，以下是一个简化且正确格式化的示例：

```bash
#!/bin/bash

URL="https://www.youtube.com/watch?v=Nqs9iyn7tOo"
PORT=6000
QUALITY="best"
RETRY_OPEN=30
RETRY_MAX=0
SEGMENT_TIMEOUT=600
STREAM_TIMEOUT=900
BUFFER_SIZE="64M"

while true; do
    echo "Starting streamlink..."
    streamlink $URL $QUALITY \
        --player-external-http \
        --player-external-http-port $PORT \
        --retry-open $RETRY_OPEN \
        --retry-max $RETRY_MAX \
        --stream-segment-timeout $SEGMENT_TIMEOUT \
        --stream-timeout $STREAM_TIMEOUT \
        --ringbuffer-size $BUFFER_SIZE

    echo "Streamlink stopped. Restarting in 5 seconds..."
    sleep 5
done
```

#### 3. **保存并退出**

- 在 `nano` 编辑器中，按 `Ctrl+O` 保存文件，按 `Enter` 确认。
- 按 `Ctrl+X` 退出编辑器。

#### 4. **重新赋予执行权限**

确保文件有执行权限：

```bash
sudo chmod +x /root/streamlink_auto_restart.sh
```

#### 5. **再次尝试执行**

使用 `bash` 或 `sh` 执行脚本：

```bash
sudo bash /root/streamlink_auto_restart.sh
```

如果脚本仍然无法运行，请仔细检查脚本的每一行，确保语法和格式都正确。
