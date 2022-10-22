//
//  DetailsView.swift
//  NBK-Test-News
//
//  Created by Bilal Bakhrom on 20/10/2022.
//

import SwiftUI
import NewsNetwork
import NukeUI

public struct DetailsView: View {
    @ObservedObject public var viewModel: DetailsViewModel
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                DetailsBackgroundImage(resource: $viewModel.resource)
                    .frame(maxHeight: .infinity)
                    .frame(width: geometry.size.width)
                    .clipped()
                    .edgesIgnoringSafeArea(.vertical)
                
                BottomSheetView(
                    isOpen: $viewModel.isBottomSheetOpen,
                    maxHeight: geometry.size.height,
                    content: {
                        ScrollView {
                            DetailsContentView(article: $viewModel.article)
                        }
                        .background(Color.theme.primaryBackground)
                        .disabled(!viewModel.isBottomSheetOpen)
                    }
                )
                .frame(width: geometry.size.width)
            }
            .background(Color.theme.primaryBackground)
            .onAppear {
                Task { await viewModel.loadImage() }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    @State static var article = Article(
        source: NewsSource(),
        author: "National Bank",
        title: "About Khasan Basri",
        description: "",
        urlToPost: "",
        pathToImage: "https://images.hindustantimes.com/tech/img/2022/10/21/1600x900/cae429b44dbf585f8628cfe0ad0d2713jpg_1639967196749_1666319002940_1666319002940.jpg",
        publishedAt: "2022-10-19T20:33:20Z",
        content:
            """
            * Ҳасан Басрий айтадилар: «Кимда-ким қуйидаги тўрт хусусиятга эга бўлса, Аллоҳ таоло уни шайтондан асрайди ва дўзахга ҳаром қилади: рағбат, қўрқув, шаҳват ва ғазаб пайтида ўзини қўлга олиш».
            
            * «Парвардигорингиз томонидан бўлгуси мағфиратга ҳамда тақводорлар учун тайёрлаб қўйилган, эни осмонлар ва ер баробарида бўлган жаннатга шошилингиз. (У тақводор зотлар) яхши-ёмон кунларда инфоқ-эҳсон қиладиган, ғазабларини ичларига ютадиган, одамларни афв этадиган кишилардир. Аллоҳ бундай яхшилик қилувчиларни севади». (Оли Имрон сураси, 133-134-оятлар).
            
            * Бир киши Расулуллоҳ соллаллоҳу алайҳи ва салламдан сўради:
                - Энг яхши амал нима?
                - Ҳусни хулқ! Бу иложи борича ғазаб
                қилмаслигингдир, — деб жавоб бердилар
                Набий соллаллоҳу алайҳи ва саллам.
            
            * Абу Ҳурайра разияллоҳу анҳудан ривоят: Расулуллоҳ соллаллоҳу алайҳи ва саллам дедилар: «Кучли деб ҳаммани енгадиган кишига айтилмайди. Ғазабланган пайтда ўзини қўлга ололган одам кучлидир!» (Бухорий ва Муслим ривоятлари).
            
            * Ҳасан Басрий айтадилар: «Кимда-ким қуйидаги тўрт хусусиятга эга бўлса, Аллоҳ таоло уни шайтондан асрайди ва дўзахга ҳаром қилади: рағбат, қўрқув, шаҳват ва ғазаб пайтида ўзини қўлга олиш».
            
            * «Парвардигорингиз томонидан бўлгуси мағфиратга ҳамда тақводорлар учун тайёрлаб қўйилган, эни осмонлар ва ер баробарида бўлган жаннатга шошилингиз. (У тақводор зотлар) яхши-ёмон кунларда инфоқ-эҳсон қиладиган, ғазабларини ичларига ютадиган, одамларни афв этадиган кишилардир. Аллоҳ бундай яхшилик қилувчиларни севади». (Оли Имрон сураси, 133-134-оятлар).
            
            * Бир киши Расулуллоҳ соллаллоҳу алайҳи ва салламдан сўради:
                - Энг яхши амал нима?
                - Ҳусни хулқ! Бу иложи борича ғазаб
                қилмаслигингдир, — деб жавоб бердилар
                Набий соллаллоҳу алайҳи ва саллам.
            
            * Абу Ҳурайра разияллоҳу анҳудан ривоят: Расулуллоҳ соллаллоҳу алайҳи ва саллам дедилар: «Кучли деб ҳаммани енгадиган кишига айтилмайди. Ғазабланган пайтда ўзини қўлга ололган одам кучлидир!» (Бухорий ва Муслим ривоятлари).
            """
    )
    
    static var previews: some View {
        DetailsView(viewModel: DetailsViewModel(article: article))
    }
}
