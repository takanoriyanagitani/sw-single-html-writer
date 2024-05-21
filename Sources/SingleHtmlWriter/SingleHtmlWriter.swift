import Foundation

/// Converts a `Foundation.Data` to a base64 `String`.
public typealias DataToBase64 = (Foundation.Data) -> String

/// Creates a ``DataToBase64`` using specified options.
public func data2base64fromOptions(
  options: Foundation.Data.Base64EncodingOptions = []
) -> DataToBase64 {
  return {
    let dat: Foundation.Data = $0
    return dat.base64EncodedString(options: options)
  }
}

/// A ``DataToBase64`` using empty options.
public let data2base64Default: DataToBase64 = data2base64fromOptions()

/// Converts a `Foundation.Data` to a data URI scheme `String`.
public typealias DataToEncoded = (Foundation.Data) -> String

public func data2encodedFromType(
  contentType: String,
  encoder: @escaping DataToBase64 = data2base64Default
) -> DataToEncoded {
  let prefix: String = "data:" + contentType + ";base64,"
  return {
    let data: Foundation.Data = $0
    let encoded: String = encoder(data)
    return prefix + encoded
  }
}
