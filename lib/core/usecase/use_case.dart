abstract class UseCase<T, P> {
  Future<T> execute({P params});
}

/// Generic types
/// dynamic types