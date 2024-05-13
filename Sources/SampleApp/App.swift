import SingleHtmlWriter

let jsPath: String = "./sample.d/index.js"
let scTag: String = SingleHtmlWriter.jspath2scriptDefault(jsPath)
print(scTag)
