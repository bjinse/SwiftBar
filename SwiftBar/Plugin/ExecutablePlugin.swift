import Foundation

struct ExecutablePlugin: Plugin {
    var id: PluginID {
        return file
    }
    let type: PluginType = .Executable
    let name: String
    let file: String
    let metadata: PluginMetadata?

    init(fileURL: URL) {
        self.name = fileURL.lastPathComponent.components(separatedBy: ".").first ?? ""
        self.file = fileURL.absoluteString

        if let script = try? String(contentsOf: fileURL) {
            self.metadata = PluginMetadata.bitbarParser(script: script)
        } else {
            metadata = nil
        }
    }

    func refresh() {

    }

    func terminate() {

    }

    func invoke(params : [String]) {
        
    }
}