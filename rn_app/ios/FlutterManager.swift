import Flutter
import FlutterPluginRegistrant

class FlutterManager {
    static let shared = FlutterManager()
    var flutterEngine: FlutterEngine?
    
    func setup() {
        flutterEngine = FlutterEngine(name: "my_flutter_engine")
        flutterEngine?.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
    }
}
