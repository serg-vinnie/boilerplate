
protocol ExecutionContext {}
protocol ReleasePoolOwner {}
protocol ObservableObject {}

@attached(extension, conformances: ExecutionContext, ReleasePoolOwner, ObservableObject)
@attached(member, names: named(executor), named(releasePool))
public macro ninjaModel() = #externalMacro(module: "boilerplateMacros", type: "NinjaModelMacro")
