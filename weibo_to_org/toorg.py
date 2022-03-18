#!/usr/bin/python3
# coding:utf-8
#

from bs4 import BeautifulSoup

soup = BeautifulSoup(open("weibo_01_finish.html"), "lxml")

data_list = {}
for data in soup.find_all(name='article'):
    title=data.div.div.get_text()[33:-10]
    url=data.div.div.a["href"]
    data_list[url] = title

size = len(data_list)
for url, title in data_list.items():
    print("%02d. [[%s][%s]]\n" % (size, url, title))
    size -= 1