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
