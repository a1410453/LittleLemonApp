//
//  Onboarding.swift
//  Little Lemon IOS
//
//  Created by Rustem Orazbayev on 6/26/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    // State variables
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false

    var body: some View {
        NavigationStack {
            Header()
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        NavigationLink(destination: Home(), isActive: $isLoggedIn) {}
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()

                    Button("Register") {
                        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        } else {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        }
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())

                    Spacer()
                }
            }.onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
