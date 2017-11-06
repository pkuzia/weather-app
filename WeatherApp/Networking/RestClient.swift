//
//  RestClient.swift
//  WeatherApp
//
//  Created by Przemysław Kuzia on 11/5/17
//  Copyright (c) 2017 pkuzia. All rights reserved.
//

import Foundation
import Moya
import Alamofire

let bodyName = "body"
let queryName = "query"

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

let weatherProvider = MoyaProvider<RestClient>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

// MARK: - Provider support

private extension String {
    var urlEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum RestClient {
    case weather(WeatherRequest)
}

extension RestClient: TargetType {
    
    public var baseURL: URL { return URL(string: "http://api.apixu.com/v1/")! }
    
    public var path: String {
        switch self {
        case .weather:
            return "forecast.json"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String: Any]? {
        switch self {
         case .weather(let weatherRequest):
            return weatherRequest.getParameters()
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        return CompositeEncoding()
    }
    
    public var task: Task {
        return .request
    }
    
    public var validate: Bool {
        switch self {
        case .weather:
            return true
        }
    }
    
    public var sampleData: Data {
        return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

struct CompositeEncoding: ParameterEncoding {
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        guard let parameters = parameters else {
            return try urlRequest.asURLRequest()
        }
        
        let queryParameters = parameters[queryName] as? Parameters
        let queryRequest = try URLEncoding(destination: .queryString).encode(urlRequest, with: queryParameters)
        
        if let bodyParameters = parameters[bodyName] as? Parameters {
            var bodyRequest = try JSONEncoding().encode(urlRequest, with: bodyParameters)
            bodyRequest.url = queryRequest.url
            return bodyRequest
        } else {
            return queryRequest
        }
    }
}
