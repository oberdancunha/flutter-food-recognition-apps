abstract class UseCase<Type, Parameter> {
  Future<Type> call(Parameter value);
}
