import SingleHtmlWriter

let jsPath: String = "./sample.d/index.js"
let scTag: String = SingleHtmlWriter.jspath2scriptDefault(jsPath)
print(scTag)

let pngPath: String = "./sample.d/img.png"
let imgTag: String = SingleHtmlWriter.pngpath2imgDefault(pngPath)
print(imgTag)
