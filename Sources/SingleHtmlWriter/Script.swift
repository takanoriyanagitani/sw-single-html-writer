import Foundation

public typealias JavaScriptToScriptTag = (Foundation.Data) -> String
public typealias JsPathToScriptTag = (String) -> String

/// Creates a ``JavaScriptToScriptTag`` using a ``DataToBase64``.
public func js2scriptFromEncoder(
  encoder: @escaping DataToBase64 = data2base64Default
) -> JavaScriptToScriptTag {
  let prefix: String = "<script src=\""
  let suffix: String = "\"></script>"
  let d2e: DataToEncoded = data2encodedFromType(
    contentType: "text/javascript",
    encoder: encoder
  )
  return {
    let jsData: Foundation.Data = $0
    let encoded: String = d2e(jsData)
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
