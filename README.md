# Flutter food recognition apps

## Anotações:

### Correção Could not build the precompiled application for the device. Lexical or Preprocessor Issue (Xcode): 'vector' file not found
 - Xcode -> Runner -> Build Settings -> All -> Apple Clang - Language -> Compile Sources As => Objective-C++

### Correção TFLite Error: "metal_delegate.h" File Not Found
 - ios -> Podfile.lock -> - TensorFlowLiteC (2.7.0): => - TensorFlowLiteC (2.2.0): -> cd ios -> pod install