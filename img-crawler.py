# -*- coding: UTF-8 –*-
# 日期：2017-12-30
# 功能：python爬虫实例，获取校花网上的图片
# 作者：quanhua
# 微信公共号: quanhuaban
 
# 引入资源文件
from urllib import request
from bs4 import BeautifulSoup
import re
import requests
import urllib
 
# 需要爬取的页面
url = 'http://www.xiaohuar.com/list-1-{}.html'
class SchoolFlower(object):
    # 初始化请求头
    def __init__(self,url):
        self.url = url
        self.header = {'User-Agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.109 Safari/537.36'}
        self.List = []
        self.Connection() #连接
    # 连接
    def Connection(self):
        content = requests.get(self.url,headers=self.header)
        content.encoding = 'utf-8'
        soup = BeautifulSoup(content.content,'html.parser',from_encoding='gbk')
        return soup
 
    def Getpicture(self):
        info = self.Connection()
        img = info.find_all('img',src=re.compile(r'/d/file/\d+/\w+\.jpg'))
        x = 0
        # 使用for循环方法进行下载图片
        for i in img:
            print('正在下载第{}张照片'.format(x))
            f = open('%s.jpg' % i.get('alt'),'wb')
            f1 = requests.get('http://www.xiaohuar.com%s' % i.get('src')).content
            f.write(f1)
            x += 1
        x = 0
#执行爬虫
for i in range(0,11):
    print('#########开始下载第{}页的图片##########'.format(i))
    f = SchoolFlower(url.format(i))
    f.Getpicture()
