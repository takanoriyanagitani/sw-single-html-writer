import Foundation

public typealias JavaScriptToScriptTag = (Foundation.Data) -> String
public typealias JsPathToScriptTag = (String) -> String

public func js2scriptFromEncoder(
  encoder: @escaping DataToBase64 = data2base64Default
) -> JavaScriptToScriptTag {
  let prefix: String = "<script src=\"data:text/javascript;base64,"
  let suffix: String = "\"></script>"
  return {
    let jsData: Foundation.Data = $0
    let encoded: String = encoder(jsData)
    return prefix + encoded + suffix
  }
}

public func jspath2script(
  encoder: @escaping DataToBase64 = data2base64Default,
  path2data: @escaping PathToData = path2dataDefault
) -> JsPathToScriptTag {
  let j2s: JavaScriptToScriptTag = js2scriptFromEncoder(encoder: encoder)
  return {
    let jsPath: String = $0
    let jsData: Foundation.Data = path2data(jsPath)
    return j2s(jsData)
  }
}

public let jspath2scriptDefault: JsPathToScriptTag = jspath2script()
