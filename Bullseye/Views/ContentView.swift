import SwiftUI

struct ContentView : View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("Round \(game.round)")
            Text("Total score \(game.totalScore)")
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO\n🎯🎯🎯")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .padding(4.0)
            Text(String(game.target))
                .fontWeight(.black)
                .font(.largeTitle)
                .kerning(-1.0)
            HStack{
                Text("1")
                    .font(.body)
                    .bold()
                    .padding(5)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .font(.body)
                    .bold()
                    .padding(6)
            }
            Button(action: {
                alertIsVisible = true
            }) {
                Text("Hit me!")
                    .bold()
                    .kerning(2.0)
                    .padding(10)
                    .foregroundColor(.red)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .stroke(Color.red, lineWidth: 4))
            }
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue = Int(sliderValue.rounded())
                let result = game.points(sliderValue: roundedValue)
                return Alert(title: Text("Hello there!"),
                             message: Text("The slider value is \(roundedValue).\n" + "You scored \(result) points this round."),
                             dismissButton: .default(Text("Awesome!"),
                                                     action: { game.update(sliderValue: roundedValue) }))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
