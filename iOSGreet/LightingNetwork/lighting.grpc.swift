//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iOSGreet/LightingNetwork/lighting.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate `Lighting_LightingServiceClient`, then call methods of this protocol to make API calls.
public protocol Lighting_LightingServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Lighting_LightingServiceClientInterceptorFactoryProtocol? { get }

  func dimLight(
    callOptions: CallOptions?
  ) -> ClientStreamingCall<Lighting_DimLightRequest, Lighting_DimLightResponse>

  func setIsOnState(
    _ request: Lighting_SetLightIsOnRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Lighting_SetLightIsOnRequest, Lighting_SetLightIsOnResponse>
}

extension Lighting_LightingServiceClientProtocol {
  public var serviceName: String {
    return "lighting.LightingService"
  }

  /// Bi-directional streaming dimming RPC.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  public func dimLight(
    callOptions: CallOptions? = nil
  ) -> ClientStreamingCall<Lighting_DimLightRequest, Lighting_DimLightResponse> {
    return self.makeClientStreamingCall(
      path: "/lighting.LightingService/DimLight",
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDimLightInterceptors() ?? []
    )
  }

  /// Unary on-off RPC.
  ///
  /// - Parameters:
  ///   - request: Request to send to SetIsOnState.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func setIsOnState(
    _ request: Lighting_SetLightIsOnRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Lighting_SetLightIsOnRequest, Lighting_SetLightIsOnResponse> {
    return self.makeUnaryCall(
      path: "/lighting.LightingService/SetIsOnState",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeSetIsOnStateInterceptors() ?? []
    )
  }
}

public protocol Lighting_LightingServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'dimLight'.
  func makeDimLightInterceptors() -> [ClientInterceptor<Lighting_DimLightRequest, Lighting_DimLightResponse>]

  /// - Returns: Interceptors to use when invoking 'setIsOnState'.
  func makeSetIsOnStateInterceptors() -> [ClientInterceptor<Lighting_SetLightIsOnRequest, Lighting_SetLightIsOnResponse>]
}

public final class Lighting_LightingServiceClient: Lighting_LightingServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Lighting_LightingServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the lighting.LightingService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Lighting_LightingServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Lighting_LightingServiceProvider: CallHandlerProvider {
  var interceptors: Lighting_LightingServiceServerInterceptorFactoryProtocol? { get }

  /// Bi-directional streaming dimming RPC.
  func dimLight(context: UnaryResponseCallContext<Lighting_DimLightResponse>) -> EventLoopFuture<(StreamEvent<Lighting_DimLightRequest>) -> Void>

  /// Unary on-off RPC.
  func setIsOnState(request: Lighting_SetLightIsOnRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Lighting_SetLightIsOnResponse>
}

extension Lighting_LightingServiceProvider {
  public var serviceName: Substring { return "lighting.LightingService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "DimLight":
      return ClientStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Lighting_DimLightRequest>(),
        responseSerializer: ProtobufSerializer<Lighting_DimLightResponse>(),
        interceptors: self.interceptors?.makeDimLightInterceptors() ?? [],
        observerFactory: self.dimLight(context:)
      )

    case "SetIsOnState":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Lighting_SetLightIsOnRequest>(),
        responseSerializer: ProtobufSerializer<Lighting_SetLightIsOnResponse>(),
        interceptors: self.interceptors?.makeSetIsOnStateInterceptors() ?? [],
        userFunction: self.setIsOnState(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol Lighting_LightingServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'dimLight'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDimLightInterceptors() -> [ServerInterceptor<Lighting_DimLightRequest, Lighting_DimLightResponse>]

  /// - Returns: Interceptors to use when handling 'setIsOnState'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeSetIsOnStateInterceptors() -> [ServerInterceptor<Lighting_SetLightIsOnRequest, Lighting_SetLightIsOnResponse>]
}