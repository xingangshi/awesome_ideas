#!/usr/bin/python
#
# coding:utf-8
#
#

# 去除 pdf 水印
#
# 必须库的安装
#
#   pip3 install frontend pymupdf
#

import fitz
import os


# 目录必须使用绝对路径，不要使用带 ~ 开始的路径
# 目标目录必须不存在，会自动创建目标文件夹
#
SRC = "/Users/panshi/Downloads/pdf_test/"
DST = "/Users/panshi/Downloads/pdf_test/pdf_test_aim/"

def delete_watermark(src, dst, width=963, height=215):
    doc = fitz.open(src)
    for page in range(doc.page_count):
        images = doc.get_page_images(page)

        for content in doc[page].get_contents():
            c = doc.xref_stream(content)
            for _, _, width, height, _, _, _, img, _ in images:
                if width == width and height == height:
                    c = c.replace("/{} Do".format(img).encode(), b"")
            doc.update_stream(content, c)

    dir = os.path.dirname(dst)
    if not os.path.exists(os.path.dirname(dst)):
        os.makedirs(dir)
    doc.save(dst)

if __name__ == "__main__":
    print("test")
    for root, dirs, files in os.walk(SRC):
        print(files)
        for file in files:
            if not file.endswith("pdf"):
                continue
            print(file)
            src = os.path.join(root, file)
            dst = os.path.join(root.replace(SRC, DST), file)
            delete_watermark(src, dst)

