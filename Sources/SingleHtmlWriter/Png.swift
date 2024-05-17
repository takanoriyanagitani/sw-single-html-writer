import Foundation

public typealias PngToImgTag = (Foundation.Data) -> String
public typealias PngPathToImgTag = (String) -> String

public func png2imgFromEncoder(
  encoder: @escaping DataToBase64 = data2base64Default
) -> PngToImgTag {
  let prefix: String = "<img src=\""
  let suffix: String = "\"></img>"
  let d2e: DataToEncoded = data2encodedFromType(
    contentType: "image/png",
    encoder: encoder
  )
  return {
    let pngData: Foundation.Data = $0
    let encoded: String = d2e(pngData)
    return prefix + encoded + suffix
  }
}

public func pngpath2img(
  encoder: @escaping DataToBase64 = data2base64Default,
  path2data: @escaping PathToData = path2dataDefault
) -> PngPathToImgTag {
  let p2s: PngToImgTag = png2imgFromEncoder(encoder: encoder)
  return {
    let pngPath: String = $0
    let pngData: Foundation.Data = path2data(pngPath)
    return p2s(pngData)
  }
}

public let pngpath2imgDefault: PngPathToImgTag = pngpath2img()

/// A png image which can be converted to `Foundation.Data`
public protocol ImageToPngData {
  func toPngData() -> Foundation.Data?
}

extension ImageToPngData {
  /// Tries to convert to an img tag.
  func toImageTag(png2img: PngToImgTag) -> String? {
    let opngData: Foundation.Data? = self.toPngData()
    guard let pngData = opngData else {
      return nil
    }
    return png2img(pngData)
  }
}
