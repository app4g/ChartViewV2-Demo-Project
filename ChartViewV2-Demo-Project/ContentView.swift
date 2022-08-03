//
//  ContentView.swift
//  aafafa
//
//  Created by Mun Heng Ow on 26/07/2022.
//
// How to add a locally cloned Package to Xcode
// Remember that you still need to add the import statement
// https://youtu.be/7rFPvj7yu4Q?t=626

import SwiftUI
import SwiftUICharts


struct ContentView: View {
  var demoData: [(String, Double)] = ([("M",9), ("T",2), ("W",5), ("T",6), ("F",7), ("S",0), ("S",0)])
  var plan: [(String, Double)] = ([("M",2), ("T",2), ("W",3), ("T",5), ("F",3), ("S",3), ("S",3)])
  var demoData2: [(String, Double, Double)] = ([("M",7,8), ("T",2,0), ("W",6,3), ("T",4,4), ("F",3,3), ("S",0,8), ("S",0,0)])
  var demoData4: [(String, Double)] = ([("M",0), ("T",2), ("W",3), ("T",4), ("F",3), ("S",8), ("S",10)])
  
  var load: [(String, Double, Double)] = ([("M",70, 80), ("T",75, 70), ("W",50, 100), ("T",0, 0), ("F",100, 100), ("S",100, 120), ("S",220, 240)])
  var time: [(String, Double, Double)] = ([("M",300, 300), ("T",600, 3600), ("W",900, 900), ("T",1800, 1200), ("F",3600, 1800), ("S",3600, 3600), ("S",0, 7200)])

  
  var body: some View {
      ScreenProperties { screenProperties in
        ScrollView(.vertical, showsIndicators: true) {
          VStack {
            HStack {
              Text("Hello, world!")
                .border(.red)
                .foregroundColor(.red)
              Spacer()

              Text(screenProperties.isiPad ? "iPad" : "iPhone")
                .border(.red)
                .foregroundColor(.red)

              Spacer()
              
              Text(screenProperties.isLandscape ? "Landscape" : "Portrait")
                .border(.red)
                .foregroundColor(.red)
              
              Spacer()
              Text(screenProperties.isSplitView ? "Split" : "Normal")
                .border(.red)
                .foregroundColor(.red)
            }
            .padding(.horizontal, 10)
          }
          
            HStack {
              CardView(showShadow: true) {
                Text("Load")
                  .padding([.horizontal, .top],10)
                  .font(.caption)
                  .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                  Text("Done\n400")
                    .padding([.horizontal],10)
                    .font(.caption)
                  Text("Plan\n600")
                    .padding([.horizontal],10)
                    .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                ChartLabel("pp", type: .custom(size: 10, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0f")

                BarChart()
                  .padding(.horizontal,10)
                  .padding(.bottom,5)
              }
              .data(demoData)
              .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
              
              CardView(showShadow: true) {
                HStack {
                    Text("Distance")
                      .padding([.leading,.top],10)
                      .font(.caption)
                  Spacer()
                  RingView(compliancePct: 0.22, lineWidth: 3, size: .tiny )
                    .frame(width: 20, height: 20)
                    .padding([.trailing, .top,],10)
                    .font(.caption)
                }
                
                ChartLabel("200/500km", type: .custom(size: 10, padding: EdgeInsets(top: -15.0, leading: 10.0, bottom: 0.0, trailing: 10.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm ")
                
                BarChart()
                  .padding(.horizontal,10)
                  .padding(.bottom,5)
              }
              .data(demoData2)
              .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
              
              // This uses the Grid Pattern
              CardView(showShadow: true) {
                ChartGrid {
                  VStack(alignment: .leading, spacing: 0) {
                    HStack{
                    Text("Time")
                        .padding([.leading, .top],10)
                        .font(.caption)
                      Spacer()
                      RingView(compliancePct: 1.50, lineWidth: 3, size: .tiny )
                        .frame(width: 20, height: 20)
                        .padding([.trailing, .top,],10)
                        .font(.caption)
                    }
                    ChartLabel("10h 50m/11h 10m", type: .custom(size: 10, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: -10.0), color: Color(UIColor.secondaryLabel)), format: "hhmmss")
                    
                    BarChart()
                      .padding(.horizontal,10)
                      .padding(.bottom,5)
                  }
                }
                .data(time)
                .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
              }

            }
            .padding(.horizontal, 10)
            .frame(width: screenProperties.size.width, height: 150, alignment: .center)
            
          
          //
          // 2nd Row
          //
          HStack {
            CardView(showShadow: true) {
              HStack {
                VStack (alignment:.leading){
                  Text("Load")
                    .font(.caption)
                  
                  ChartLabel("499/500", type: .custom(size: 15, padding: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0f ")
                  
                }
                .padding([.horizontal, .top], 10)
                
                Spacer()
                RingView(compliancePct: 1.8, lineWidth: 4, size: .large)
                  .frame(width: 40, height: 40)
                  .padding([.trailing, .top,],10)
                  .font(.caption)
              }
              
              BarChart()
                .padding(.horizontal,10)
                .padding(.bottom,5)
            }
            .data(load)
            .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
            
            CardView(showShadow: true) {
              HStack {
                VStack (alignment: .leading) {
                  Text("Time")
                    .font(.caption)
                    .padding([.leading, .top], 10)
                
                  ChartLabel("10h 30m/11h 00m", type: .custom(size: 10, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 10.0), color: Color(UIColor.secondaryLabel)), format: "hhmmss")

                }
                Spacer()
                
                RingView(compliancePct: 0.69, lineWidth: 4, size:.small)
                  .frame(width: 30, height: 30)
                  .padding([.trailing, .top,],10)
                  .font(.caption)
              }
              
              BarChart()
                .padding(.horizontal,10)
                .padding(.bottom,5)
            }
            .data(time)
            .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
            
            //          CardView(showShadow: true) {
            //            HStack {
            //              VStack (alignment:.leading){
            //                Text("Distance2")
            //                  .font(.caption)
            //
            //                Text("400/500km")
            //                  .lineLimit(1)
            //                  .font(.caption)
            //              }
            //              .padding([.horizontal, .top], 10)
            //
            //              Spacer()
            //              RingView(compliancePct: 0.6)
            //                .frame(width: 30, height: 30)
            //                .padding([.trailing, .top,],10)
            //                .font(.caption)
            //            }
            //
            //            ChartLabel("", type: .custom(size: 10, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 10.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm")
            //            BarChart()
            //              .padding(.horizontal,10)
            //              .padding(.bottom,5)
            //          }
            //          .data(demoData2)
            //          .chartStyle(ChartStyle(backgroundColor: .white,
            //                                 foregroundColor: [ColorGradient(.blue, .purple)]
            //                                ))
          }
          .padding(.horizontal, 10)
          .frame(width: screenProperties.size.width, height: (screenProperties.size.width-20)/3, alignment: .center)
          
          
          //
          // 3rd Row
          //
          HStack {
            CardView(showShadow: true) {
              HStack {
                //              Ring(
                //                ringWidth: 50, percent: 5 ,
                //                foregroundColor: ColorGradient(.green, .blue), touchLocation: -1.0
                //              )
                //              .frame(width: 200, height: 200)
                RingView(compliancePct: 1.6, lineWidth: 10, primaryColor: Color.orange, secondaryColor: Color.orange, size: .large)
                  .padding([.leading, .vertical],10)
                  .frame(width: 130, height: 130)
                  .font(.largeTitle)
                
                VStack (alignment:.leading) {
                  Text("Distance")
                    .padding(.leading, 10)
                    .font(.caption)
                  
                  ChartLabel("200/500km", type: .custom(size: 15, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm ")
                  
                  BarChart()
                    .padding(.horizontal, 10)
                    .padding(.bottom,5)
                  
                }
                .padding([.top], 10)
                
              }
            }
            .data(demoData2)
            .chartStyle(ChartStyle(backgroundColor: .black,foregroundColor: [ColorGradient(.red, .orange)]))
          }
          .padding(.horizontal, 10)
          .frame(width: screenProperties.size.width, height: 150, alignment: .center)
          
          
          //
          // 4rd Row
          //
          HStack {
            CardView(showShadow: false) {
              HStack {
                VStack (alignment:.leading) {
                  Text("Distance")
                    .padding(.leading, 10)
                    .font(.caption)
                  
                  ChartLabel("200/500km", type: .custom(size: 15, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm ")
                  
                }
                .padding([.top], 10)
                
              }
              
              HStack {
                RingView(compliancePct: 0.6, lineWidth: 8)
                  .padding([.leading, .bottom],16)
                  .frame(width: 100, height: 100)
                  .font(.title)
                
                BarChart()
                  .padding(.horizontal,10)
                //            .padding(.leading,100)
                  .padding(.bottom,5)
              }
            }
            .data(plan)
            .chartStyle(ChartStyle(backgroundColor: .black,foregroundColor: [ColorGradient(.orange, .red)]))
          }
          //        .padding(.horizontal, 40)
          .frame(width: screenProperties.size.width, height: 150, alignment: .center)
          
          
          //
          // 5th Row
          //
          HStack {
            CardView(showShadow: true) {
              HStack {
                VStack (alignment:.leading){
                  Text("Distance")
                    .font(.caption)
                  
                  ChartLabel("200/500km", type: .custom(size: 15, padding: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm ")
                  
                }
                .padding([.horizontal, .top], 10)
                
                Spacer()
                RingView(compliancePct: 0.6)
                  .frame(width: 40, height: 40)
                  .padding([.trailing, .top,],10)
                  .font(.subheadline)
              }
              
              //          ChartLabel("200/500km", type: .custom(size: 10, padding: EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 0.0), color: Color(UIColor.secondaryLabel)), format: "%0.0fkm")
              BarChart()
                .padding(.horizontal,10)
                .padding(.bottom,5)
            }
            .data(demoData2)
            .chartStyle(ChartStyle(backgroundColor: .white,foregroundColor: [ColorGradient(.blue, .purple)]))
          }
          .padding(.horizontal, 10)
          .frame(width: screenProperties.size.width, height: 200, alignment: .center)
        }
      }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

