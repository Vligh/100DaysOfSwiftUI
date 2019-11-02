import SwiftUI
import Combine

final class UserData: ObservableObject {
  @Published var showFavoritesOnly = false
  @Published var landmarks = landmarkData
  @Published var profile = Profile.default
}
