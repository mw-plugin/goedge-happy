# goedge-happy
CDN & WAF集群管理系统/GoEdge开心版
网络流传版本

- https://www.nodeseek.com/post-139661-1

# 安装
rm -rf /www/server/mdserver-web/plugins/goedge-happy && cd /www/server/mdserver-web/plugins && rm -rf gorse && git clone https://github.com/mw-plugin/goedge-happy && cd goedge-happy && rm -rf .git && cd /www/server/mdserver-web/plugins/goedge-happy && bash install.sh install 1.3.9


# 开心版激活码

```
F4BuVYEKSDWV+I13ISd5NUyBcWOlH0af4/ow9obzYBS3XvYC9IsK86k5UDyyBv9vqJWN2/FQTDbPyuAO0zxYlkLDC0c8rrShs+7PAkqM0O8wBIGknzForgidDZahky5Lo/ZWaPZ1dVFUxmV29ykb0I0b4tv7Q3OtnTylOuzf//MYrlvyw6VJQMGnsttmeHzsNL/r0yDONOEXZoGoLZsuBKnkfXt+qt6bZF+kM1ncbh+sY42BrPTWQ12sXqJS3qHlzU0FFl9lTNzLGYYhq5vi/4sJuPVE50/uLCtslTJdb9zOGR915hnM+jHYsR+jUk0QxOqtreaHpsvNuLkexXbkmA==
```

# 屏蔽官方域名
```
echo "127.0.0.1 goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
echo "127.0.0.1 goedge.cn" | sudo tee -a /etc/hosts > /dev/null
echo "127.0.0.1 dl.goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
echo "127.0.0.1 dl.goedge.cn" | sudo tee -a /etc/hosts > /dev/null
echo "127.0.0.1 global.dl.goedge.cloud" | sudo tee -a /etc/hosts > /dev/null
echo "127.0.0.1 global.dl.goedge.cn" | sudo tee -a /etc/hosts > /dev/null
cat /etc/hosts
```

### 手动修改hosts文件
```
vi /etc/hosts
127.0.0.1 goedge.cn
127.0.0.1 goedge.cloud
127.0.0.1 dl.goedge.cloud
127.0.0.1 dl.goedge.cn
127.0.0.1 global.dl.goedge.cloud
127.0.0.1 global.dl.goedge.cn
```
