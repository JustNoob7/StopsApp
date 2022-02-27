//
//  StopDetailsViewController.swift
//  StopsApp
//
//  Created by Ярослав Бойко on 26.02.2022.
//

import UIKit
import MapKit

class StopDetailsViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var viewModel: StopDetailsViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupUI()
        makePin()
    }
    
    private func setupUI() {
        title = viewModel.name
    }
    
    private func makePin() {
        let location = CLLocationCoordinate2D(latitude: viewModel.lat, longitude: viewModel.lon)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
    }

}
