//
//  ViewOnBoard.swift
//  EkarTest
//
//  Created by Aqib Javed on 25/10/2023.
//

import SwiftUI
import PhotosUI

@MainActor
final class ViewOnBoardViewModel: ObservableObject {
    private enum selectionType {
        case FL
        case FR
        case BL
        case BR
    }

    @Published var FLselectedImage: UIImage? = nil
    @Published var FRselectedImage: UIImage? = nil
    @Published var BLselectedImage: UIImage? = nil
    @Published var BRselectedImage: UIImage? = nil
    @Published var imageSelectionFL: PhotosPickerItem? = nil {
        didSet {
            setimage(from: imageSelectionFL, to: .FL)
        }
    }
    @Published var imageSelectionFR: PhotosPickerItem? = nil {
        didSet {
            setimage(from: imageSelectionFR, to: .FR)
        }
    }
    @Published var imageSelectionBL: PhotosPickerItem? = nil {
        didSet {
            setimage(from: imageSelectionBL, to: .BL)
        }
    }
    @Published var imageSelectionBR: PhotosPickerItem? = nil {
        didSet {
            setimage(from: imageSelectionBR, to: .BR)
        }
    }

    private func setimage(from selection: PhotosPickerItem?,to type: selectionType) {
        guard let selection else {return}
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let selectedImage = UIImage(data: data) {
                    switch type {
                    case .FL:
                        FLselectedImage = selectedImage
                    case .FR:
                        FRselectedImage = selectedImage
                    case .BL:
                        BLselectedImage = selectedImage
                    case .BR:
                        BRselectedImage = selectedImage
                    }
                }
                return
            }
        }
    }



}

struct ViewOnBoard: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = ViewOnBoardViewModel()
    @State var comment: String = ""
    @State var showPopup: Bool = false
    var FL: Image = Image("FL")
    var FR: Image = Image("FR")
    var BL: Image = Image("BL")
    var BR: Image = Image("BR")
    var body: some View {
        ScrollView {
            VStack {
                header
                Text("Please upload clear photos of your vehicle to avoid liability of any damages caused before starting your reservation")
                    .padding(.top, 50)
                    .padding(.horizontal, 50)
                    .font(.headline)
                carCard
                VStack (alignment: .leading){
                    Text("Leave a comment")
                    TextField("Everything looks great!", text: $comment)
                        .frame(width: .fullScreenWidth - 40, height: 30)
                        .overlay(Divider(), alignment: .bottom)
                        .padding(.bottom, 20)



                    Text("Submit")
                        .frame(width: .fullScreenWidth - 40, height: 70)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(.cyan)
                        .cornerRadius(15) /// make the background rounded
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.white, lineWidth: 1)
                        )
                        .onTapGesture {
                            showPopup.toggle()
                        }
                }.padding(50)

            }
            .alert(isPresented: $showPopup) {
                Alert(title: Text("Attention"), message: Text("Thank you for choosing ekar."), dismissButton: .default(Text("Got it!")))
            }
        }
    }


    private var carCard: some View {
        VStack{
            HStack {
                PhotosPicker(selection: $viewModel.imageSelectionFL,
                             matching: .images) {
                    if let fl = viewModel.FLselectedImage {
                        Image(uiImage: fl)
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    } else {
                        FL
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    }
                }
                PhotosPicker(selection: $viewModel.imageSelectionFR,
                             matching: .images) {
                    if let fr = viewModel.FRselectedImage {
                        Image(uiImage: fr)
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    } else {
                        FR
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    }
                }
            }
            HStack {
                PhotosPicker(selection: $viewModel.imageSelectionBL,
                             matching: .images) {
                    if let bl = viewModel.BLselectedImage {
                        Image(uiImage: bl)
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    } else {
                        BL
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    }
                }
                PhotosPicker(selection: $viewModel.imageSelectionBR,
                             matching: .images) {
                    if let br = viewModel.BRselectedImage {
                        Image(uiImage: br)
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    } else {
                        BR
                            .resizable()
                            .frame(width: (.fullScreenWidth/2) - 20, height: (.fullScreenWidth/2) - 40)
                    }
                }
            }
            .padding(10)
        }
        .cornerRadius(20) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 2)
        )
        .padding(.horizontal, 30)
    }

    private var  header: some View {
        HStack {
            Image(systemName: "multiply")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
            Image("ekarlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal, 30)
    }

}

struct ViewOnBoard_Previews: PreviewProvider {
    static var previews: some View {
        ViewOnBoard()
    }
}

private extension CGFloat {
    static let fullScreenWidth: CGFloat = UIScreen.main.bounds.width
    static let fullScreenHeight: CGFloat = UIScreen.main.bounds.height

}
