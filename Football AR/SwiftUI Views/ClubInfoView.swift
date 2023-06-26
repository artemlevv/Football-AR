//
//  ClubInfoView.swift
//  Football AR
//
//  Created by ARTEM on 23.06.2023.
//

import SwiftUI

struct ClubInfoView: View {
    
    //MARK: - Club info variables
    let clubName: String
    let club: Club?
    let description: String
    let footballApi = FootballAPI()
    let engEnumClub: EnglishClub
    
    //MARK: - Bool to swict to mask screen
    @State private var showFaceMaskController = false
    
    init(clubName: String){
        self.clubName = clubName
        self.engEnumClub = EnglishClub(clubName: clubName) ?? .UnknownClub
        self.club = footballApi.getClubInfo(clubID: engEnumClub.clubID)
        print(self.club)
        self.description = engEnumClub.description
    }
    
    var body: some View {
        if let club = self.club{
           correctView(curClub: club)
        }
        else{
            errorView()
        }
    }
    
    @ViewBuilder
    private func errorView() -> some View{
        VStack{
            Text("Problems with internet connection")
                .font(.system(size: 23, weight: .bold))
                .foregroundColor(.gray)
        }
    }
    @ViewBuilder
    private func correctView(curClub: Club) -> some View{
        VStack {
            ScrollView{
                HStack{
                    VStack{
                        AsyncImage(url: URL(string: changeSvg(curClub.crest))){ image in
                            image.image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        }
                        .padding(10)
                    }
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.backButtonColor, lineWidth: 4))
                    .shadow(radius: 10)
                    .frame(width: 100, height: 60)
                    .padding(.top, 20)
                    HStack{
                        Spacer()
                        Text(clubName)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.top, 20)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.trailing, 16)
                .padding(.leading, 16)
                
                HStack {
                    Button(action: {
                        withAnimation{
                            showFaceMaskController = true
                        }
                    }) {
                        Text("Try masks")
                            .font(.system(size: 19, weight: .bold))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 60)
                    }
                    .background(Color.backButtonColor)
                    .cornerRadius(15)
                }
                .padding(.top, 30)
                
                VStack{
                    HStack{
                        Text("Info")
                            .font(.system(size: 21, weight: .medium))
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    .padding(.leading, 5)
                    Text(self.description)
                        .fontWidth(.condensed)
                }
                .padding(16)
                
                VStack{
                    HStack{
                        Text("Club Address:")
                            .font(.system(size: 21, weight: .medium))
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack{
                        //clubg.address
                        Text(curClub.address)
                            .fontWidth(.condensed)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    HStack{
                        Text("Website:")
                            .font(.system(size: 21, weight: .medium))
                        
                        Link("Tap here to visit club website", destination: URL(string: curClub.website)!)
                            .fontWidth(.condensed)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }
                .padding(.leading, 20)
                
                RunningCompetition(competititons: curClub.runningCompetitions)
                    .padding(.top, 10)
                TeamView(coach: curClub.coach, squad: curClub.squad)
                    .padding(.top, 20)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $showFaceMaskController) {
            FaceMaskView(clubName: self.clubName)
        }
    }
    
}

struct FaceMaskView: View {
    @Environment(\.presentationMode) private var presentationMode
    let clubName: String
    
    var body: some View {
        NavigationView {
                   VStack {
                       GotoFaceMaskController(clubName: self.clubName)
                   }
                   .navigationBarBackButtonHidden(true) // Hide the default back button
                   .navigationBarItems(leading: backButton) // Show custom back button
               }
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrowshape.backward.fill")
                .font(.system(size: 20))
                .foregroundColor(Color.backButtonColor)
        }
        .padding(.horizontal, 16)
    }
}

struct GotoFaceMaskController: UIViewControllerRepresentable {
    let clubName: String
    typealias UIViewControllerType = FaceMaskViewController
        
    func makeUIViewController(context: Context) -> FaceMaskViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "FaceMaskViewController") as? FaceMaskViewController else {
            fatalError("Unable to instantiate StartViewController from storyboard")
        }
        viewController.clubName = self.clubName
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: FaceMaskViewController, context: Context) {
        // Update the view controller if needed
    }
}
