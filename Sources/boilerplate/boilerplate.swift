
@attached(extension)
@attached(member, names: named(context), named(releasePool))
public macro ninjaModel() = #externalMacro(module: "MyMacroMacros", type: "NinjaModelMacro")
