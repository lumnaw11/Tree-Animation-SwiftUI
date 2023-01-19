//
//  ContentView.swift
//  TreeAnimation
//
//  Created by Lum Naw on 2023/01/17.
//


import SwiftUI

struct ContentView: View {
@State private var isSpinning = false

    struct Ring: Hashable {
        
        var size : CGFloat          //star size
        var setX: CGFloat           //star offsetX
        var setY: CGFloat           //ring offsetY
        var circleFrame: CGFloat     //circle frame
        var delay: CGFloat          //delay of star animation
        var colors: Color           //ring color
        
        init(size: CGFloat,setX: CGFloat, setY: CGFloat, circleFrame: CGFloat, delay: CGFloat, colors: Color) {
            self.size = size
            self.setX = setX
            self.setY = setY
            self.circleFrame = circleFrame
            self.delay = delay
            self.colors = colors
        } //init end
    }//struct end
    
    let rings = [
        Ring(size: 10, setX: 20, setY: 0, circleFrame: 40, delay: 0, colors: Color.yellow),
        Ring(size: 10, setX: 35, setY: 30, circleFrame: 70, delay: 0.9, colors: Color.orange),
        Ring(size: 12, setX: 50, setY: 60, circleFrame: 100, delay: 1.8, colors: Color.orange),
        Ring(size: 13, setX: 65, setY: 90, circleFrame: 130, delay: 2.7, colors: Color.red),
        Ring(size: 13, setX: 80, setY: 120, circleFrame: 160, delay: 3.6, colors: Color.red),
        Ring(size: 14, setX: 95, setY: 150, circleFrame: 190, delay: 4.5, colors: Color.purple),
        Ring(size: 15, setX: 110, setY: 180, circleFrame: 220, delay: 5.4, colors: Color.blue),
        Ring(size: 15, setX: 125, setY: 210, circleFrame: 250, delay: 6.3, colors: Color.mint),
        Ring(size: 16, setX: 140, setY: 240, circleFrame: 280, delay: 7.2, colors: Color.green)
    ]
    var body: some View {
        VStack{
            Image(systemName: "wand.and.stars.inverse")
                .font(.system(size:50))
                .foregroundStyle(EllipticalGradient(
                    colors: [Color.red, Color.green],
                    center: .center ,
                    startRadiusFraction: 0.0,
                    endRadiusFraction: 0.5))
                .hueRotation(.degrees(isSpinning ? 0:340))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(0.2), value: isSpinning)
                .offset(x: 0,y: 100)
            ZStack{
                ForEach(rings, id: \.self) {ring in
                    ZStack{
                            Circle()
                            .stroke(ring.colors, lineWidth: 3)
                            .frame(width: ring.circleFrame, height: ring.circleFrame)
            
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(Color.yellow)
                            .hueRotation(.degrees(isSpinning ? 0:340))
                            .offset(x:ring.setX, y: 0)
                            .rotation3DEffect(Angle.degrees(isSpinning ? 360:0),
                                              axis: (x: 0,y: 0, z:1))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(ring.delay).speed(0.5), value: isSpinning)
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(Color.yellow)
                            .hueRotation(.degrees(isSpinning ? 0:340))
                            .offset(x:ring.setX, y: 0)
                            .rotation3DEffect(Angle.degrees(isSpinning ? 360:0),
                                              axis: (x: 0,y: 0, z:1))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(ring.delay + 0.3).speed(0.5), value: isSpinning)
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundStyle(Color.yellow)
                            .hueRotation(.degrees(isSpinning ? 0:300))
                            .offset(x:ring.setX, y: 0)
                            .rotation3DEffect(Angle.degrees(isSpinning ? 360:0),
                                              axis: (x: 0,y: 0, z:1))
                            .animation(.linear(duration: 1).repeatForever(autoreverses: false).delay(ring.delay + 0.6).speed(0.5), value: isSpinning)
                        }
                        .rotation3DEffect(Angle.degrees(55), axis: (x: 1,y: 0, z:0))
                        .offset(x: 0, y: ring.setY)
                   
                } //for each loop end
            }//zstack end
            .position(x: 200, y: 100)
            .onAppear(){
                isSpinning.toggle()
            }
        }.background(Color.black) //vstack end
    } //body end
} //contentview end

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView()
}
}
