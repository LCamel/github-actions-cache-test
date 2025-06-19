#!/bin/bash

echo "==== $0 開始執行"
echo "當前時間: $(date)"
echo "工作目錄: $HOME/work"

echo "檢查 work 目錄狀態..."
if [ -d "$HOME/work" ]; then
    echo "work 目錄存在"
    echo "目錄權限: $(ls -ld $HOME/work)"
else
    echo "work 目錄不存在，正在創建..."
    mkdir -p $HOME/work
fi

echo "執行前的工作目錄內容："
ls -la $HOME/work/ || echo "work 目錄為空"
echo "檔案數量: $(ls -1 $HOME/work/ 2>/dev/null | wc -l)"

echo "創建新的時間戳檔案..."
TIMESTAMP=$(date +%s)
echo "新檔案名: $TIMESTAMP"
echo "執行時間: $(date)" > $HOME/work/$TIMESTAMP
echo "建立檔案完成"

echo "執行後的工作目錄內容："
ls -la $HOME/work/
echo "檔案數量: $(ls -1 $HOME/work/ | wc -l)"

echo "所有檔案的內容："
if ls $HOME/work/* 1> /dev/null 2>&1; then
    for file in $HOME/work/*; do
        echo "=== 檔案: $(basename $file) ==="
        cat "$file"
    done
else
    echo "沒有找到任何檔案"
fi

echo "==== $0 完成"