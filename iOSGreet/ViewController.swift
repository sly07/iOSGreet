//
//  ViewController.swift
//  iOSGreet
//
//  Created by Michael Sly on 12/13/21.
//

import UIKit
import Foundation
import GRPC
import NIO
import NIOSSL

class ViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    private var client: Greet_GreetServiceClient?
    private var stream: BidirectionalStreamingCall<Greet_GreetEveryoneRequest, Greet_GreetEveryoneResponse>?
    
    @IBAction func greetButtonTapped(_ sender: Any) {
        guard let client = self.client else {
            print("Client not set")
            return
        }
        
        let greeting: Greet_Greeting = .with {
            //            $0.firstName = "Mike"
            //            $0.lastName = "Sly"
            $0.firstName = firstName.text ?? ""
            $0.lastName = lastName.text ?? ""            
        }
        
        let greetingRequest: Greet_GreetRequest = .with {
            $0.greeting = greeting
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let call = client.greet(greetingRequest)
            
            do {
                let response = try call.response.wait()
                DispatchQueue.main.async {
                    self.responseLabel.text = response.result
                }
            } catch {
                print("exception thrown")
            }
        }
    }
    
    @IBAction func greetManyTimesButtonTapped(_ sender: Any) {
        guard let client = self.client else {
            print("Client not set")
            return
        }
        
        let greeting: Greet_Greeting = .with {
            //            $0.firstName = "Mike"
            //            $0.lastName = "Sly"
            $0.firstName = firstName.text ?? ""
            $0.lastName = lastName.text ?? ""
        }
        
        let request: Greet_GreetManyTimesRequest = .with {
            $0.greeting = greeting
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let call = client.greetManyTimes(request) { response in
                DispatchQueue.main.async {
                    self.responseLabel.text = response.result
                }
                print(response.result)
            }
            
            do {
                _ = try call.status.wait()
                DispatchQueue.main.async {
                    self.responseLabel.text = "server stream finished."
                }
            } catch {
                print("error")
            }
        }
    }
    
    @IBAction func greetEveryoneButtonTapped(_ sender: Any) {
        guard let client = self.client else {
            print("Client not set")
            return
        }
        
        if self.stream == nil {
            self.stream = client.greetEveryone { response in
                DispatchQueue.main.async {
                    self.responseLabel.text = response.result
                    print(response.result)
                }
            }
        } else {
            _ = self.stream?.sendEnd()
            self.stream = nil
        }
    }
    
    @IBAction func firstNameChanged(_ sender: Any) {
        guard let stream = self.stream else {
            return
        }
        
        DispatchQueue.main.async {
            let greeting: Greet_Greeting = .with {
                //            $0.firstName = "Mike"
                //            $0.lastName = "Sly"
                $0.firstName = self.firstName.text ?? ""
                $0.lastName = self.firstName.text ?? ""
            }
            
            let request: Greet_GreetEveryoneRequest = .with {
                $0.greeting = greeting
            }
            
            print("sending request")
            _ = stream.sendMessage(request)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ClientConnection.Configuration(
            target: .hostAndPort("localhost", 50051),
            eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1))
        
        self.client = Greet_GreetServiceClient(channel: ClientConnection(configuration: configuration))
    }
}

