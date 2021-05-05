//
//  ContentView.swift
//  lifecounter
//
//  Created by stlp on 4/22/21.
//

import SwiftUI

var width: CGFloat {
    return UIScreen.main.bounds.width
}

var height: CGFloat {
    return UIScreen.main.bounds.height
}

var paddingScale: CGFloat {
    return UIScreen.main.bounds.width / 50
}


var fontSize: CGFloat {
    if UIDevice.current.userInterfaceIdiom == .phone {
        return 1
    } else {
        return 1.5
    }
}

struct ContentView: View {
    @State var jokes: [String] = ["What's a good joke?", "I bought some shoes from a drug dealer...", "How much did the chimeny cost?"]
    @State var answers: [String] = ["The fact that I'm an Econ major and still don't know what shorting the market is despite watching the Big Short 5 times and Game Stop skyrocketing back in January :)", "I don't know what he laced them with because I was tripping all day", "Nothing, it's on the house!"]
    @State var knock: [String] = ["Knock, knock", "Who's there?", "Art Art who?", "R2-D2, of course."]
    @State var images: [String] = ["joke1", "joke2", "joke3", "joke4"]
    var body: some View {
        TabView {
            Jokes(joke: $jokes[0], answer: $answers[0])
                .padding()
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Good")
                }
                .tag(1)
            Jokes(joke: $jokes[1], answer: $answers[1])
                .padding()
                .tabItem {
                    Image(systemName: "pencil.tip")
                    Text("Pun")
                }
                .tag(2)
            Jokes(joke: $jokes[2], answer: $answers[2])
                .padding()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Dad")
                }
                .tag(3)
            ImageJokes(images: $images)
                .padding()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Images")
                }
                .tag(4)
            KnockKnock(phrase: $knock)
                .padding()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Knock")
                }
                .tag(5)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Jokes: View {
    @Binding var joke: String
    @Binding var answer: String
    @State var reveal: Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack(alignment: .center) {
                    Group{
                        Text(reveal ? answer : joke).font(.system(size: 25 * fontSize)).padding(width/20).multilineTextAlignment(.center).frame(width: metrics.size.width, height: metrics.size.height / 1.1, alignment: .center)
                        
                        
                        Button(action: {
                            self.reveal.toggle()
                        }) {
                            Spacer()
                            Text(reveal ? "Back" : "Next" ).frame(alignment: .bottomTrailing).multilineTextAlignment(.trailing).font(.system(size: 25 * fontSize))
                        }
                    }
                }.frame(width: metrics.size.width, height: metrics.size.height, alignment: .center)
            }
        }
    }
}




struct ImageJokes: View {
    @Binding var images: [String]
    @State var count: Int = 0
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack(alignment: .center) {
                    Group{
                        Spacer()
                        Image(images[count]).resizable()
                            .scaledToFit()
                        Spacer()
                        HStack {
                        Button(action: {
                            if (count > 0) {
                                count -= 1
                            }
                        }) {
                           
                            Text("Back").frame(alignment: .bottomTrailing).multilineTextAlignment(.trailing).font(.system(size: 25 * fontSize)).foregroundColor(count == 0 ? .gray : .blue)
                        }
                        Spacer()
                        Button(action: {
                            if (count < images.count - 1) {
                                count += 1
                            }
                        }) {
                         
                            Text("Next").frame(alignment: .bottomTrailing).multilineTextAlignment(.trailing).font(.system(size: 25 * fontSize)).foregroundColor(count == images.count - 1 ? .gray : .blue)
                        }
                        }
                    }
                }.frame(width: metrics.size.width, height: metrics.size.height, alignment: .center)
            }
        }
    }
}

struct KnockKnock: View {
    @Binding var phrase: [String]
    @State var count: Int = 0
    
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack(alignment: .center) {
                    Group{
                        Text(phrase[count]).font(.system(size: 25 * fontSize)).padding(width/20).multilineTextAlignment(.center).frame(width: metrics.size.width, height: metrics.size.height / 1.1, alignment: .center)
                        HStack {
                        Button(action: {
                            if (count > 0) {
                                count -= 1
                            }
                        }) {
                           
                            Text("Back").frame(alignment: .bottomTrailing).multilineTextAlignment(.trailing).font(.system(size: 25 * fontSize)).foregroundColor(count == 0 ? .gray : .blue)
                        }
                        Spacer()
                        Button(action: {
                            if (count < phrase.count - 1) {
                                count += 1
                            }
                        }) {
                         
                            Text("Next").frame(alignment: .bottomTrailing).multilineTextAlignment(.trailing).font(.system(size: 25 * fontSize)).foregroundColor(count == phrase.count - 1 ? .gray : .blue)
                        }
                        }
                    }
                }.frame(width: metrics.size.width, height: metrics.size.height, alignment: .center)
            }
        }
    }
    
}
