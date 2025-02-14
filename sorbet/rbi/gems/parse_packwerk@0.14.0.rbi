# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `parse_packwerk` gem.
# Please instead update this file by running `bin/tapioca gem parse_packwerk`.

module ParsePackwerk
  class << self
    sig { returns(T::Array[::ParsePackwerk::Package]) }
    def all; end

    sig { void }
    def bust_cache!; end

    sig { params(name: ::String).returns(T.nilable(::ParsePackwerk::Package)) }
    def find(name); end

    sig { params(file_path: T.any(::Pathname, ::String)).returns(::ParsePackwerk::Package) }
    def package_from_path(file_path); end

    sig { params(package: ::ParsePackwerk::Package).void }
    def write_package_yml!(package); end

    sig { returns(::ParsePackwerk::Configuration) }
    def yml; end

    private

    sig { returns(T::Hash[::String, ::ParsePackwerk::Package]) }
    def packages_by_name; end
  end
end

class ParsePackwerk::Configuration < ::T::Struct
  const :exclude, T::Array[::String]
  const :package_paths, T::Array[::String]

  class << self
    sig { params(config_hash: T::Hash[T.untyped, T.untyped]).returns(T::Array[::String]) }
    def excludes(config_hash); end

    sig { returns(::ParsePackwerk::Configuration) }
    def fetch; end

    def inherited(s); end

    sig { params(config_hash: T::Hash[T.untyped, T.untyped]).returns(T::Array[::String]) }
    def package_paths(config_hash); end
  end
end

ParsePackwerk::DEFAULT_EXCLUDE_GLOBS = T.let(T.unsafe(nil), Array)
ParsePackwerk::DEFAULT_PACKAGE_PATHS = T.let(T.unsafe(nil), Array)
ParsePackwerk::DEFAULT_PUBLIC_PATH = T.let(T.unsafe(nil), String)
ParsePackwerk::DEPENDENCIES = T.let(T.unsafe(nil), String)
ParsePackwerk::DEPRECATED_REFERENCES_YML_NAME = T.let(T.unsafe(nil), String)

class ParsePackwerk::DeprecatedReferences < ::T::Struct
  const :pathname, ::Pathname
  const :violations, T::Array[::ParsePackwerk::Violation]

  class << self
    sig { params(package: ::ParsePackwerk::Package).returns(::ParsePackwerk::DeprecatedReferences) }
    def for(package); end

    sig { params(pathname: ::Pathname).returns(::ParsePackwerk::DeprecatedReferences) }
    def from(pathname); end

    def inherited(s); end
  end
end

ParsePackwerk::ENFORCE_DEPENDENCIES = T.let(T.unsafe(nil), String)
ParsePackwerk::ENFORCE_PRIVACY = T.let(T.unsafe(nil), String)
ParsePackwerk::METADATA = T.let(T.unsafe(nil), String)
ParsePackwerk::MetadataYmlType = T.type_alias { T::Hash[T.untyped, T.untyped] }

class ParsePackwerk::MissingConfiguration < ::StandardError
  sig { params(packwerk_file_name: ::Pathname).void }
  def initialize(packwerk_file_name); end
end

ParsePackwerk::PACKAGE_YML_NAME = T.let(T.unsafe(nil), String)
ParsePackwerk::PACKWERK_YML_NAME = T.let(T.unsafe(nil), String)
ParsePackwerk::PUBLIC_PATH = T.let(T.unsafe(nil), String)

class ParsePackwerk::Package < ::T::Struct
  const :dependencies, T::Array[::String]
  const :enforce_dependencies, T::Boolean
  const :enforce_privacy, T::Boolean
  const :metadata, T::Hash[T.untyped, T.untyped]
  const :name, ::String
  const :public_path, ::String, default: T.unsafe(nil)

  sig { returns(::Pathname) }
  def directory; end

  sig { returns(T::Boolean) }
  def enforces_dependencies?; end

  sig { returns(T::Boolean) }
  def enforces_privacy?; end

  sig { returns(::Pathname) }
  def public_directory; end

  sig { returns(T::Array[::ParsePackwerk::Violation]) }
  def violations; end

  sig { returns(::Pathname) }
  def yml; end

  class << self
    sig { params(pathname: ::Pathname).returns(::ParsePackwerk::Package) }
    def from(pathname); end

    def inherited(s); end
  end
end

class ParsePackwerk::PackageSet
  class << self
    sig do
      params(
        package_pathspec: T::Array[::String],
        exclude_pathspec: T::Array[::String]
      ).returns(T::Array[::ParsePackwerk::Package])
    end
    def from(package_pathspec:, exclude_pathspec:); end

    private

    sig { params(globs: T::Array[::String], path: ::Pathname).returns(T::Boolean) }
    def exclude_path?(globs, path); end
  end
end

ParsePackwerk::ROOT_PACKAGE_NAME = T.let(T.unsafe(nil), String)

class ParsePackwerk::Violation < ::T::Struct
  const :class_name, ::String
  const :files, T::Array[::String]
  const :to_package_name, ::String
  const :type, ::String

  sig { returns(T::Boolean) }
  def dependency?; end

  sig { returns(T::Boolean) }
  def privacy?; end

  class << self
    def inherited(s); end
  end
end
