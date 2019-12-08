//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Vitali Tatarintev on 08.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AddressView: View {
  @ObservedObject var order: Order

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
  }
}

struct AddressView_Previews: PreviewProvider {
  static var previews: some View {
    AddressView(order: Order())
  }
}
