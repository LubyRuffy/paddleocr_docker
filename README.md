# paddleocr_docker

其他的方式编译的文件都太大，也很难编译通过，进行大量测试，实践了如下的版本，目前基于2.5进行docker打包，生成的文件大小约为1.5G，勉强可以接受。

## 编译
```
docker build -t lubyruffy/paddleocr:2.5 .
```

## 导出
```
docker save -o paddleocr_2.5.tar lubyruffy/paddleocr:2.5
```

## 运行
```
docker run --rm -p5000:5000 lubyruffy/paddleocr:2.5
```

## 检测：
```
curl "http://127.0.0.1:5000/api/ocr_dec" -X POST -H "Content-Type: application/json" -d '{"img_url":"https://ai.bdstatic.com/file/5419067D
0B374C12A8CFB5C74684CC06"}'
```