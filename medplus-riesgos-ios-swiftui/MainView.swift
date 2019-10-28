
import SwiftUI
import SwiftyJSON

struct MainView: View {


    @State var totalClicked: Int = 0
    @State private var user: String = ""
    @State private var password: String = ""

    @State var isSecret: Bool = true


    var body: some View {
        NavigationView {
            VStack(alignment: .center) {

                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, height: 80)
                    .padding(.bottom, 100)
                TextField("Email o usuario", text: $user)
                    .frame(width: 200, height: 20)
                    .padding(.all)
                ZStack(alignment: .trailing) {
                    if (isSecret) {
                        SecureField("Contraseña", text: $password)
                            .frame(width: 200, height: 20)
                    } else {
                        TextField("Contraseña", text: $password)
                            .frame(width: 200, height: 20)
                    }

                    Button(action: {
                        self.isSecret = !self.isSecret
                    }) {
                        Image((self.isSecret) ? "visibilityOff" : "visibility")
                            .frame(width: 10, height: 10)
                    }
                }.padding(.bottom, 50)


                NavigationLink(destination: HomeView()) {
                    Text("Ingresar")
                        .font(.title)
                        .foregroundColor(.white)
                }
                    .frame(width: 120, height: 20)
                    .padding(.all)
                    .foregroundColor(.white)
                    .background(Color("color_primary"))
                    .cornerRadius(5)

                VStack(alignment: .trailing) {
                    Image("banner")

                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 80)
                        .padding(.trailing, 20)
                }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)






                Spacer()
            }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color.white)



        }
    }

    /*func getDataWebServices(bodyRequest: String) {
        WebServices.requestPostBasic(pathMethod: .URL_SELECT, data: bodyRequest, callbackSuccess: { response in
            print(response!)
        }, callbackFail: { fail in
                print(fail!)
            })
    }*/

    func goToNextSection() {

    }

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
