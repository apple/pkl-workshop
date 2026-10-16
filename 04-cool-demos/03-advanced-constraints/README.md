# Advanced Constraints

Pkl's type constraint system can be used to build complex logic to enforce non-trivial business requirements.

In this demo, the [app-env-cluster example](../../03-building-abstractions/03-app-env-cluster) is extended to enforce a new requirement: no single pod may be configured that requests more resources than are available on any node in the target cluster.

## Additions in this example

Changes compared to the prior example are highlighted by comments prefixed by `NEW`.
These changes include:
* Defining the node size (maximum requests).
* A new `K8sResources.validateNodeResources()` method implementing the constraint's business logic.
* Changes to `production/us-west/prometheus.pkl` to illustrate a constraint failed.

To see this new validation in action, run:
```bash
pkl eval production/us-west/prometheus.pkl
```

## Advanced expressions

This demo also illustrates some more advanced Pkl expressions that are worth observing:
* `let` expressions bind values for reuse or organization within an expression.
* `Any.ifNonNull()` aids in using nullable values in access chains.
* `Map.fold()`, `Map.mapValues()`, `Map.every()`, `List.fold()`, `List.map()`, and `List.every()` methods provide advanced tools for manipulating, processing, and transforming collections.

>[!NOTE]
> This demo uses the `Map`/`List` collection types in favor of `Mapping`/`Listing` object types when manipulating data.
> The collection types can be easier to work with and more performant in these situations, but it is idiomatic to use the corresponding object types in schemas.
