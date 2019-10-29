
import SwiftUI

struct LandmarkList: View {
  var body: some View {
    List(landmarkData, id: \.id) { landmark in
      LandmarkRow(landmark: landmark)
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
  }
}
