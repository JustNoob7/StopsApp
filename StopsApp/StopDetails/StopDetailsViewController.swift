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
        makePin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomController()
    }
    
    @IBAction func backButtonPressed() {
        dismiss(animated: true)
    }
    
    private func makePin() {
        let location = CLLocationCoordinate2D(latitude: viewModel.lat, longitude: viewModel.lon)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.showAnnotations([annotation], animated: true)
        mapView.selectAnnotation(annotation, animated: true)
    }
    
    private func showBottomController() {
        let bottomVC = StopDetailsBottomTableViewController()
        if let sheet = bottomVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        bottomVC.viewModel = viewModel.bottomControllerViewModel()
        present(bottomVC, animated: true)
    }
}
