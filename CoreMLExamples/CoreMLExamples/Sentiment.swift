import UIKit

enum Sentiment {
  case neutral
  case positive
  case negative

  var emoji: String {
    switch self {
    case .neutral:
      return "😐"
    case .positive:
      return "😃"
    case .negative:
      return "😔"
    }
  }

  var color: UIColor? {
    switch self {
    case .neutral:
      return UIColor.blue
    case .positive:
      return UIColor.green
    case .negative:
      return UIColor.red
    }
  }
}
