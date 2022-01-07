//
//  LightingViewController.swift
//  iOSGreet
//
//  Created by Michael Sly on 12/15/21.
//

import UIKit
import GRPC
import NIO

class LightingViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    private let lightId = "100"
    
    private var stream: ClientStreamingCall<Lighting_DimLightRequest, Lighting_DimLightResponse>?
    private var client: Lighting_LightingServiceClient?
    
    override func viewDidLoad() {
        let configuration = ClientConnection.Configuration(
            target: .hostAndPort("localhost", 50051),
            eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1))
        
        self.client = Lighting_LightingServiceClient(channel: ClientConnection(configuration: configuration))
    }

    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        
        guard let stream = self.stream else {
            print("no stream")
            return
        }
        
        let request: Lighting_DimLightRequest = .with {
            $0.deviceID = lightId
            $0.dimLevel = Int32(self.slider.value)
        }
        
        print("Sending dimLevel")
        _ = stream.sendMessage(request)
    }
    
    @IBAction func touchDown(_ sender: Any) {
        guard let client = self.client else {
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.stream = client.dimLight()
        
        
            self.stream?.status.whenComplete({ _ in
                print("finished")
            })
            
            self.stream?.response.whenSuccess({ response in
                DispatchQueue.main.async {
                    self.sliderLabel.text = "dimLevel = \(response.dimLevel)"
                }
            })
        }
    }
    
    @IBAction func touchUpInside(_ sender: Any) {
        guard let stream = self.stream else {
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            stream.sendEnd(promise: nil)
            _ = try! stream.response.wait()
            _ = try! stream.status.wait()
            print("Stream End")
        }
    }
    
    @IBAction func touchUpOutside(_ sender: Any) {
        guard let stream = self.stream else {
            return
        }
        
        stream.cancel(promise: nil)
        //_ = try! stream.response.wait()
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        guard let client = self.client else {
            return
        }
        
        let request: Lighting_SetLightIsOnRequest = .with {
            $0.id = lightId
            $0.isOn = self.lightSwitch.isOn
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let call = client.setIsOnState(request)
            let response = try! call.response.wait()
            print(response)
            DispatchQueue.main.async {
                if response.light.isOn {
                    self.slider.value = Float(response.light.dimLevel)
                } else {
                    self.slider.value = 0
                }
            }
        }
    }
}
