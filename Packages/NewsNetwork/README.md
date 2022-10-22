# NewsNetwork

This module consists of all data related to the News APIs. 

Structure of files: 
- Environment: Holds base URLs. 
- Router: It has to implement RequestConvertible protocol. Router holds request info such as end point, http method, parameters, headers.
- Service: It has to inherit AdaptableNetwork class. Service is collection of methods to request data and receive correct models. 
