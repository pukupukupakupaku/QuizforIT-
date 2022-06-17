//
//  DetailDataViewController.swift
//  
//
//  Created by 上條栞汰 on 2022/06/08.
//

import UIKit
import Charts

class DetailDataViewController: UIViewController {
    
    var chartView: LineChartView!
    var chartDataSet: LineChartDataSet!
    // 今回使用するサンプルデータ
    let sampleData = [80,90,80,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // グラフを表示する
        displayChart(data: sampleData)
    }
    
    func displayChart(data: [Int]) {
        // グラフの範囲を指定する
        chartView = LineChartView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 400))
        // プロットデータ(y軸)を保持する配列
        var dataEntries = [ChartDataEntry]()
        
        for (xValue, yValue) in data.enumerated() {
            let dataEntry = ChartDataEntry(x: Double(Int(xValue)), y: Double(Int(yValue)))
            dataEntries.append(dataEntry)
        }
        // グラフにデータを適用
        chartDataSet = LineChartDataSet(entries: dataEntries, label: "SampleDataChart")
        
        chartDataSet.lineWidth = 5.0 // グラフの線の太さを変更
        chartDataSet.mode = .cubicBezier // 滑らかなグラフの曲線にする
        
        chartView.data = LineChartData(dataSet: chartDataSet)
        
        // X軸(xAxis)
        chartView.xAxis.labelPosition = .bottom // x軸ラベルをグラフの下に表示する
        
        // Y軸(leftAxis/rightAxis)
        chartView.leftAxis.axisMaximum = 100 //y左軸最大値
        chartView.leftAxis.axisMinimum = 0 //y左軸最小値
        chartView.leftAxis.labelCount = 6 // y軸ラベルの数
        chartView.rightAxis.enabled = false // 右側の縦軸ラベルを非表示
        
        // その他の変更
        chartView.highlightPerTapEnabled = false // プロットをタップして選択不可
        chartView.legend.enabled = false // グラフ名（凡例）を非表示
        chartView.pinchZoomEnabled = false // ピンチズーム不可
        chartView.doubleTapToZoomEnabled = false // ダブルタップズーム不可
        chartView.extraTopOffset = 20 // 上から20pxオフセットすることで上の方にある値(99.0)を表示する
        
        chartView.animate(xAxisDuration: 4) // 2秒かけて左から右にグラフをアニメーションで表示する
        
        view.addSubview(chartView)
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


