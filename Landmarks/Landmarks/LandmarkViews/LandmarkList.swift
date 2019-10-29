
import SwiftUI

struct LandmarkList: View {
  var body: some View {
    List {
      LandmarkRow(landmark: landmarkData[0])
      LandmarkRow(landmark: landmarkData[1])
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    LandmarkList()
  }
}
