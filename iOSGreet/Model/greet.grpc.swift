//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iOSGreet/Model/greet.proto
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


/// Usage: instantiate `Greet_GreetServiceClient`, then call methods of this protocol to make API calls.
public protocol Greet_GreetServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Greet_GreetServiceClientInterceptorFactoryProtocol? { get }

  func greet(
    _ request: Greet_GreetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Greet_GreetRequest, Greet_GreetResponse>

  func greetManyTimes(
    _ request: Greet_GreetManyTimesRequest,
    callOptions: CallOptions?,
    handler: @escaping (Greet_GreetManyTimesResponse) -> Void
  ) -> ServerStreamingCall<Greet_GreetManyTimesRequest, Greet_GreetManyTimesResponse>

  func longGreet(
    callOptions: CallOptions?
  ) -> ClientStreamingCall<Greet_LongGreetRequest, Greet_LogGreetResponse>

  func greetEveryone(
    callOptions: CallOptions?,
    handler: @escaping (Greet_GreetEveryoneResponse) -> Void
  ) -> BidirectionalStreamingCall<Greet_GreetEveryoneRequest, Greet_GreetEveryoneResponse>

  func greetWithDeadline(
    _ request: Greet_GreetWithDeadlineRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Greet_GreetWithDeadlineRequest, Greet_GreetWithDeadlineResponse>
}

extension Greet_GreetServiceClientProtocol {
  public var serviceName: String {
    return "greet.GreetService"
  }

  /// Unary RPC.
  ///
  /// - Parameters:
  ///   - request: Request to send to Greet.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func greet(
    _ request: Greet_GreetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Greet_GreetRequest, Greet_GreetResponse> {
    return self.makeUnaryCall(
      path: "/greet.GreetService/Greet",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGreetInterceptors() ?? []
    )
  }

  /// Server Streaming RPC.
  ///
  /// - Parameters:
  ///   - request: Request to send to GreetManyTimes.
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ServerStreamingCall` with futures for the metadata and status.
  public func greetManyTimes(
    _ request: Greet_GreetManyTimesRequest,
    callOptions: CallOptions? = nil,
    handler: @escaping (Greet_GreetManyTimesResponse) -> Void
  ) -> ServerStreamingCall<Greet_GreetManyTimesRequest, Greet_GreetManyTimesResponse> {
    return self.makeServerStreamingCall(
      path: "/greet.GreetService/GreetManyTimes",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGreetManyTimesInterceptors() ?? [],
      handler: handler
    )
  }

  /// Client Streaming RPC.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata, status and response.
  public func longGreet(
    callOptions: CallOptions? = nil
  ) -> ClientStreamingCall<Greet_LongGreetRequest, Greet_LogGreetResponse> {
    return self.makeClientStreamingCall(
      path: "/greet.GreetService/LongGreet",
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLongGreetInterceptors() ?? []
    )
  }

  /// Bi-directional Streaming RPC.
  ///
  /// Callers should use the `send` method on the returned object to send messages
  /// to the server. The caller should send an `.end` after the final message has been sent.
  ///
  /// - Parameters:
  ///   - callOptions: Call options.
  ///   - handler: A closure called when each response is received from the server.
  /// - Returns: A `ClientStreamingCall` with futures for the metadata and status.
  public func greetEveryone(
    callOptions: CallOptions? = nil,
    handler: @escaping (Greet_GreetEveryoneResponse) -> Void
  ) -> BidirectionalStreamingCall<Greet_GreetEveryoneRequest, Greet_GreetEveryoneResponse> {
    return self.makeBidirectionalStreamingCall(
      path: "/greet.GreetService/GreetEveryone",
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGreetEveryoneInterceptors() ?? [],
      handler: handler
    )
  }

  /// Deadline example.
  ///
  /// - Parameters:
  ///   - request: Request to send to GreetWithDeadline.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  public func greetWithDeadline(
    _ request: Greet_GreetWithDeadlineRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Greet_GreetWithDeadlineRequest, Greet_GreetWithDeadlineResponse> {
    return self.makeUnaryCall(
      path: "/greet.GreetService/GreetWithDeadline",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGreetWithDeadlineInterceptors() ?? []
    )
  }
}

public protocol Greet_GreetServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'greet'.
  func makeGreetInterceptors() -> [ClientInterceptor<Greet_GreetRequest, Greet_GreetResponse>]

  /// - Returns: Interceptors to use when invoking 'greetManyTimes'.
  func makeGreetManyTimesInterceptors() -> [ClientInterceptor<Greet_GreetManyTimesRequest, Greet_GreetManyTimesResponse>]

  /// - Returns: Interceptors to use when invoking 'longGreet'.
  func makeLongGreetInterceptors() -> [ClientInterceptor<Greet_LongGreetRequest, Greet_LogGreetResponse>]

  /// - Returns: Interceptors to use when invoking 'greetEveryone'.
  func makeGreetEveryoneInterceptors() -> [ClientInterceptor<Greet_GreetEveryoneRequest, Greet_GreetEveryoneResponse>]

  /// - Returns: Interceptors to use when invoking 'greetWithDeadline'.
  func makeGreetWithDeadlineInterceptors() -> [ClientInterceptor<Greet_GreetWithDeadlineRequest, Greet_GreetWithDeadlineResponse>]
}

public final class Greet_GreetServiceClient: Greet_GreetServiceClientProtocol {
  public let channel: GRPCChannel
  public var defaultCallOptions: CallOptions
  public var interceptors: Greet_GreetServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the greet.GreetService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  public init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Greet_GreetServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
public protocol Greet_GreetServiceProvider: CallHandlerProvider {
  var interceptors: Greet_GreetServiceServerInterceptorFactoryProtocol? { get }

  /// Unary RPC.
  func greet(request: Greet_GreetRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Greet_GreetResponse>

  /// Server Streaming RPC.
  func greetManyTimes(request: Greet_GreetManyTimesRequest, context: StreamingResponseCallContext<Greet_GreetManyTimesResponse>) -> EventLoopFuture<GRPCStatus>

  /// Client Streaming RPC.
  func longGreet(context: UnaryResponseCallContext<Greet_LogGreetResponse>) -> EventLoopFuture<(StreamEvent<Greet_LongGreetRequest>) -> Void>

  /// Bi-directional Streaming RPC.
  func greetEveryone(context: StreamingResponseCallContext<Greet_GreetEveryoneResponse>) -> EventLoopFuture<(StreamEvent<Greet_GreetEveryoneRequest>) -> Void>

  /// Deadline example.
  func greetWithDeadline(request: Greet_GreetWithDeadlineRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Greet_GreetWithDeadlineResponse>
}

extension Greet_GreetServiceProvider {
  public var serviceName: Substring { return "greet.GreetService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  public func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Greet":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Greet_GreetRequest>(),
        responseSerializer: ProtobufSerializer<Greet_GreetResponse>(),
        interceptors: self.interceptors?.makeGreetInterceptors() ?? [],
        userFunction: self.greet(request:context:)
      )

    case "GreetManyTimes":
      return ServerStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Greet_GreetManyTimesRequest>(),
        responseSerializer: ProtobufSerializer<Greet_GreetManyTimesResponse>(),
        interceptors: self.interceptors?.makeGreetManyTimesInterceptors() ?? [],
        userFunction: self.greetManyTimes(request:context:)
      )

    case "LongGreet":
      return ClientStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Greet_LongGreetRequest>(),
        responseSerializer: ProtobufSerializer<Greet_LogGreetResponse>(),
        interceptors: self.interceptors?.makeLongGreetInterceptors() ?? [],
        observerFactory: self.longGreet(context:)
      )

    case "GreetEveryone":
      return BidirectionalStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Greet_GreetEveryoneRequest>(),
        responseSerializer: ProtobufSerializer<Greet_GreetEveryoneResponse>(),
        interceptors: self.interceptors?.makeGreetEveryoneInterceptors() ?? [],
        observerFactory: self.greetEveryone(context:)
      )

    case "GreetWithDeadline":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Greet_GreetWithDeadlineRequest>(),
        responseSerializer: ProtobufSerializer<Greet_GreetWithDeadlineResponse>(),
        interceptors: self.interceptors?.makeGreetWithDeadlineInterceptors() ?? [],
        userFunction: self.greetWithDeadline(request:context:)
      )

    default:
      return nil
    }
  }
}

public protocol Greet_GreetServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'greet'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGreetInterceptors() -> [ServerInterceptor<Greet_GreetRequest, Greet_GreetResponse>]

  /// - Returns: Interceptors to use when handling 'greetManyTimes'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGreetManyTimesInterceptors() -> [ServerInterceptor<Greet_GreetManyTimesRequest, Greet_GreetManyTimesResponse>]

  /// - Returns: Interceptors to use when handling 'longGreet'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLongGreetInterceptors() -> [ServerInterceptor<Greet_LongGreetRequest, Greet_LogGreetResponse>]

  /// - Returns: Interceptors to use when handling 'greetEveryone'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGreetEveryoneInterceptors() -> [ServerInterceptor<Greet_GreetEveryoneRequest, Greet_GreetEveryoneResponse>]

  /// - Returns: Interceptors to use when handling 'greetWithDeadline'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGreetWithDeadlineInterceptors() -> [ServerInterceptor<Greet_GreetWithDeadlineRequest, Greet_GreetWithDeadlineResponse>]
}