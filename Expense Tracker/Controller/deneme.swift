import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pie Chart oluşturma
        let pieChart = PieChart(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.addSubview(pieChart)
        pieChart.backgroundColor = .white
        
        // Verileri ayarlama
        pieChart.setValues([
            PieChartData(title: "Değer 1", value: 25, color: UIColor(red: 229/255, green: 249/255, blue: 219/255, alpha: 0.7)),
            PieChartData(title: "Değer 2", value: 35, color: UIColor(red: 160/255, green: 216/255, blue: 179/255, alpha: 0.7)),
            PieChartData(title: "Değer 3", value: 20, color: UIColor(red: 162/255, green: 163/255, blue: 120/255, alpha: 0.7)),
            PieChartData(title: "Değer 4", value: 10, color: UIColor(red: 131/255, green: 118/255, blue: 79/255, alpha: 0.7)),
            PieChartData(title: "Değer 5", value: 3, color: UIColor(red: 229/255, green: 249/255, blue: 219/255, alpha: 0.7))
        ])
    }

}

// Pie Chart sınıfı oluşturma
class PieChart: UIView {
    
    var values: [PieChartData] = []
    
    func setValues(_ values: [PieChartData]) {
        self.values = values
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        // Ortamı al
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Ortamı temizle
      //  context.clear(rect)
        
        // Çizim ayarları
        let lineWidth: CGFloat = 2.0
        let lineColor = UIColor.white.cgColor
        let font = UIFont.systemFont(ofSize: 12, weight: .black)
        let textColor = UIColor.black
        
        
        // Verileri hesapla
        let totalValue = values.reduce(0, { $0 + $1.value })
        var startAngle: CGFloat = -CGFloat.pi / 2
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth
        
        // Sektörleri çiz
        for value in values {
            let endAngle = startAngle + 2 * CGFloat.pi * (value.value / totalValue)
            context.move(to: center)
            context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context.setFillColor(value.color.cgColor)
            context.fillPath()
            context.setStrokeColor(lineColor)
            context.setLineWidth(lineWidth)
            context.strokePath()
            
            // Sektör başlıklarını çiz
            let midAngle = (startAngle + endAngle) / 2
            let title = value.title
            let titleRadius = radius / 2
            let titleX = center.x + titleRadius * cos(midAngle)
            let titleY = center.y + titleRadius * sin(midAngle)
            let titlePoint = CGPoint(x: titleX, y: titleY)
            let titleSize = title.size(withAttributes: [NSAttributedString.Key.font: font])
            let titleRect = CGRect(x: titlePoint.x - titleSize.width / 2, y: titlePoint.y - titleSize.height / 2, width: titleSize.width, height: titleSize.height)
            let titleAttributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
           // title.draw(in: titleRect, withAttributes: titleAttributes)
            
            startAngle = endAngle
        }
    }
    
}

// Pie Chart veri yapısı oluşturma
struct PieChartData {
    let title: String
    let value: CGFloat
    let color: UIColor
}
