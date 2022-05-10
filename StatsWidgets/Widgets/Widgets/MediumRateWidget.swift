//
//  SmallRateWidget.swift
//  StatsWidgetsExtension
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import WidgetKit
import SwiftUI

struct MediumRateWidget: Widget {
    let placeholder = StatsContent(date: Date(),
                                   passRate: 75,
                                   testTaken: 0,
                                   testsTakenNum: 10,
                                   correctAnswers: 0,
                                   correctAnswersNum: 374,
                                   questionsTaken: 0,
                                   answeredQuestions: 400)
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MediumRateWidget", provider: Provider(placeholder: placeholder)) { entry in
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    PassRateView(title: "Widgets.PassRate".localized,
                                 progressFontSize: 19.scale,
                                 progress: entry.passRate / 100,
                                 titleColor: Color.make(0, green: 173, blue: 239),
                                 progressColor: Color.make(11, green: 119, blue: 189))
                    Spacer()
                    HStack() {
                        MediumVerticalRateView(count: entry.testsTakenNum,
                                               title: "Widgets.TestsTaken".localized,
                                               color: Color.make(0, green: 173, blue: 239))
                        Spacer()
                        MediumVerticalRateView(count: entry.correctAnswersNum,
                                               title: "Widgets.CorrectAnswers".localized,
                                               color: Color.make(11, green: 119, blue: 189))
                        Spacer()
                        MediumVerticalRateView(count: entry.answeredQuestions,
                                               title: "Widgets.QuestionsTaken".localized,
                                               color: Color.make(251, green: 217, blue: 2))
                    }
                }
                .padding(16)
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Widgets.Medium.Name".localized)
        .description("Widgets.Medium.Description".localized)
    }
}
