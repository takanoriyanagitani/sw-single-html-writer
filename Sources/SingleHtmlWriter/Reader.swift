import Foundation

public typealias PathToData = (String) -> Foundation.Data

public func path2dataOrAlt(alt: Foundation.Data = Data()) -> PathToData {
  return {
    let pat: String = $0
    return Foundation.FileManager.default.contents(atPath: pat) ?? alt
  }
}

public let path2dataDefault: PathToData = path2dataOrAlt()
