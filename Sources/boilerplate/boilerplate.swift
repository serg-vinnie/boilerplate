
import AsyncNinja
import SwiftUI

@attached(peer)
@attached(member, names: named(executor), named(releasePool))
public macro ninjaModel() = #externalMacro(module: "boilerplateMacros", type: "NinjaModelMacro")
