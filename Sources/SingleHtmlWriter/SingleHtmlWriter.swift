import Foundation

public typealias DataToBase64 = (Foundation.Data) -> String

public func data2base64fromOptions(
  options: Foundation.Data.Base64EncodingOptions = []
) -> DataToBase64 {
  return {
    let dat: Foundation.Data = $0
    return dat.base64EncodedString(options: options)
  }
}

public let data2base64Default: DataToBase64 = data2base64fromOptions()
