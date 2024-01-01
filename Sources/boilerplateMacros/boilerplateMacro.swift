import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct NinjaModelMacro: PeerMacro, MemberMacro {
    public static func expansion(of node: SwiftSyntax.AttributeSyntax, 
                                 providingPeersOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
                                 in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.DeclSyntax] {
        
        guard let classDecl = node.as(SwiftSyntax.ClassDeclSyntax.self) else {
            fatalError("compiler: not a class")
        }
        
        return ["extension \(classDecl.name): ExecutionContext, ReleasePoolOwner, ObservableObject {}"]
    }
    
    public static func expansion(of node: SwiftSyntax.AttributeSyntax,
                                 providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax,
                                 in context: some SwiftSyntaxMacros.MacroExpansionContext)
    throws -> [SwiftSyntax.DeclSyntax] {
        ["public let executor    = Executor.init(queue: DispatchQueue.main)",
         "public let releasePool = ReleasePool()"]
    }
    
//    public static func expansion(of node: SwiftSyntax.AttributeSyntax,
//                                 attachedTo declaration: some SwiftSyntax.DeclGroupSyntax,
//                                 providingExtensionsOf type: some SwiftSyntax.TypeSyntaxProtocol,
//                                 conformingTo protocols: [SwiftSyntax.TypeSyntax],
//                                 in context: some SwiftSyntaxMacros.MacroExpansionContext) throws -> [SwiftSyntax.ExtensionDeclSyntax] {
//        try [ExtensionDeclSyntax("extension \(type.trimmed): ExecutionContext, ReleasePoolOwner, ObservableObject {}")]
//    }
    
    
}

@main
struct boilerplatePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        NinjaModelMacro.self,
    ]
}
