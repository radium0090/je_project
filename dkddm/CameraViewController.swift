//
//  CameraViewController.swift
//  dkddm
//
//  Created by 是レイ on 2019/01/16.
//  Copyright © 2019年 SHI LEI. All rights reserved.
//

import AVFoundation
import UIKit
import Foundation

typealias Handler = (String?) -> Void
var scanJanCode = ""

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @objc var handler: Handler?
    var session: AVCaptureSession!
    
    @IBOutlet private weak var preView: UIImageView!
    @IBOutlet private weak var recognitionLabel: UILabel!
    @IBOutlet private weak var scanBarLayout: UIView!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let device = AVCaptureDevice.default(for: .video)
        session = AVCaptureSession()
        var input: AVCaptureDeviceInput? = nil
        if let aDevice = device {
            input = try? AVCaptureDeviceInput(device: aDevice)
        }
        if input != nil {
            if let anInput = input {
                session.addInput(anInput)
            }
        } else {
            print("error")
        }
        // Output
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.ean13, .ean8]
        // Preview
        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = CGRect(x: 0, y: 0, width: preView.frame.size.width, height: preView.frame.size.height)
        preView.layer.addSublayer(preview)
        // Start
        session.startRunning()
    }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count > 0 {
            session.stopRunning()
            let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if metadataObject.type == AVMetadataObject.ObjectType.ean13 || metadataObject.type == AVMetadataObject.ObjectType.ean8 {
                let strValue = metadataObject.stringValue
                print("meter data bbbb : \(String(describing: strValue))")
                if (self.handler != nil) {
                    handler!(strValue)
                }
            } else {
                session.startRunning()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = HUGE
        animation.fromValue = 1.0
        animation.toValue = 0.2
        recognitionLabel.layer.add(animation, forKey: "opacityAnimation")
        scanBarLayout.layer.add(animation, forKey: "opacityAnimation")
    }
    
    func showAlert(_ msg: String?) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
            alert.dismiss(animated: true) {
                self.session.startRunning()
            }
        })
    }
    
}
