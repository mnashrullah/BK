//
//  Badges.swift
//  mila
//
//  Created by hilmy ghozy on 07/12/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

struct Badges: View {
    
        var body: some View {
            Rectangle()
            .fill(Color.red)
                .frame(width: 700, height: 400)
        }
}

struct Badges_Previews: PreviewProvider {
    static var previews: some View {
        Badges()
    }
}
