//  Created by Iiro Alhonen on 7.9.2022.

import Foundation
import PackagePlugin

@main
struct Builder: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        let tool = try context.tool(named: "Publish")
        let process = Process()
        process.executableURL = URL(fileURLWithPath: tool.path.string)
        process.arguments = [
            "generate"
        ]
        try process.run()
        process.executableURL?.stopAccessingSecurityScopedResource()
        process.waitUntilExit()

        if process.terminationReason == .exit && process.terminationStatus == 0 {
            print("Created output files.")
        } else {
            let problem = "\(process.terminationReason):\(process.terminationStatus)"
            Diagnostics.error("Failed to create output files: \(problem)")
        }
    }
}
