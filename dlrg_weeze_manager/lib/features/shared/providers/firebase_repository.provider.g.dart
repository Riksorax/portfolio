// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_repository.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveMemberRepoHash() => r'cb0029c27f5e4969f64f3fc853bf131f7c22667c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [saveMemberRepo].
@ProviderFor(saveMemberRepo)
const saveMemberRepoProvider = SaveMemberRepoFamily();

/// See also [saveMemberRepo].
class SaveMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [saveMemberRepo].
  const SaveMemberRepoFamily();

  /// See also [saveMemberRepo].
  SaveMemberRepoProvider call(
    Member member,
  ) {
    return SaveMemberRepoProvider(
      member,
    );
  }

  @override
  SaveMemberRepoProvider getProviderOverride(
    covariant SaveMemberRepoProvider provider,
  ) {
    return call(
      provider.member,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveMemberRepoProvider';
}

/// See also [saveMemberRepo].
class SaveMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [saveMemberRepo].
  SaveMemberRepoProvider(
    Member member,
  ) : this._internal(
          (ref) => saveMemberRepo(
            ref as SaveMemberRepoRef,
            member,
          ),
          from: saveMemberRepoProvider,
          name: r'saveMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveMemberRepoHash,
          dependencies: SaveMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              SaveMemberRepoFamily._allTransitiveDependencies,
          member: member,
        );

  SaveMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.member,
  }) : super.internal();

  final Member member;

  @override
  Override overrideWith(
    FutureOr<bool> Function(SaveMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveMemberRepoProvider._internal(
        (ref) => create(ref as SaveMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        member: member,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _SaveMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveMemberRepoProvider && other.member == member;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, member.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `member` of this provider.
  Member get member;
}

class _SaveMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with SaveMemberRepoRef {
  _SaveMemberRepoProviderElement(super.provider);

  @override
  Member get member => (origin as SaveMemberRepoProvider).member;
}

String _$getMemberRepoHash() => r'e6c2b749676206c1a29a99c90a3b52330a0ffbb5';

/// See also [getMemberRepo].
@ProviderFor(getMemberRepo)
const getMemberRepoProvider = GetMemberRepoFamily();

/// See also [getMemberRepo].
class GetMemberRepoFamily extends Family<AsyncValue<Member?>> {
  /// See also [getMemberRepo].
  const GetMemberRepoFamily();

  /// See also [getMemberRepo].
  GetMemberRepoProvider call(
    String memberNumber,
  ) {
    return GetMemberRepoProvider(
      memberNumber,
    );
  }

  @override
  GetMemberRepoProvider getProviderOverride(
    covariant GetMemberRepoProvider provider,
  ) {
    return call(
      provider.memberNumber,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMemberRepoProvider';
}

/// See also [getMemberRepo].
class GetMemberRepoProvider extends AutoDisposeFutureProvider<Member?> {
  /// See also [getMemberRepo].
  GetMemberRepoProvider(
    String memberNumber,
  ) : this._internal(
          (ref) => getMemberRepo(
            ref as GetMemberRepoRef,
            memberNumber,
          ),
          from: getMemberRepoProvider,
          name: r'getMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMemberRepoHash,
          dependencies: GetMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              GetMemberRepoFamily._allTransitiveDependencies,
          memberNumber: memberNumber,
        );

  GetMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memberNumber,
  }) : super.internal();

  final String memberNumber;

  @override
  Override overrideWith(
    FutureOr<Member?> Function(GetMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMemberRepoProvider._internal(
        (ref) => create(ref as GetMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memberNumber: memberNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Member?> createElement() {
    return _GetMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMemberRepoProvider && other.memberNumber == memberNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memberNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMemberRepoRef on AutoDisposeFutureProviderRef<Member?> {
  /// The parameter `memberNumber` of this provider.
  String get memberNumber;
}

class _GetMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<Member?> with GetMemberRepoRef {
  _GetMemberRepoProviderElement(super.provider);

  @override
  String get memberNumber => (origin as GetMemberRepoProvider).memberNumber;
}

String _$updateMemberRepoHash() => r'30c6e4b19ee9ede1a478a9027cbec76b28d10359';

/// See also [updateMemberRepo].
@ProviderFor(updateMemberRepo)
const updateMemberRepoProvider = UpdateMemberRepoFamily();

/// See also [updateMemberRepo].
class UpdateMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [updateMemberRepo].
  const UpdateMemberRepoFamily();

  /// See also [updateMemberRepo].
  UpdateMemberRepoProvider call(
    Member member,
  ) {
    return UpdateMemberRepoProvider(
      member,
    );
  }

  @override
  UpdateMemberRepoProvider getProviderOverride(
    covariant UpdateMemberRepoProvider provider,
  ) {
    return call(
      provider.member,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateMemberRepoProvider';
}

/// See also [updateMemberRepo].
class UpdateMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateMemberRepo].
  UpdateMemberRepoProvider(
    Member member,
  ) : this._internal(
          (ref) => updateMemberRepo(
            ref as UpdateMemberRepoRef,
            member,
          ),
          from: updateMemberRepoProvider,
          name: r'updateMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateMemberRepoHash,
          dependencies: UpdateMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              UpdateMemberRepoFamily._allTransitiveDependencies,
          member: member,
        );

  UpdateMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.member,
  }) : super.internal();

  final Member member;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateMemberRepoProvider._internal(
        (ref) => create(ref as UpdateMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        member: member,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateMemberRepoProvider && other.member == member;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, member.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `member` of this provider.
  Member get member;
}

class _UpdateMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with UpdateMemberRepoRef {
  _UpdateMemberRepoProviderElement(super.provider);

  @override
  Member get member => (origin as UpdateMemberRepoProvider).member;
}

String _$deleteMemberRepoHash() => r'b5e9127782aaf6f23103bbcabf628fbf2f9d3781';

/// See also [deleteMemberRepo].
@ProviderFor(deleteMemberRepo)
const deleteMemberRepoProvider = DeleteMemberRepoFamily();

/// See also [deleteMemberRepo].
class DeleteMemberRepoFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteMemberRepo].
  const DeleteMemberRepoFamily();

  /// See also [deleteMemberRepo].
  DeleteMemberRepoProvider call(
    String memberNumber,
  ) {
    return DeleteMemberRepoProvider(
      memberNumber,
    );
  }

  @override
  DeleteMemberRepoProvider getProviderOverride(
    covariant DeleteMemberRepoProvider provider,
  ) {
    return call(
      provider.memberNumber,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteMemberRepoProvider';
}

/// See also [deleteMemberRepo].
class DeleteMemberRepoProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteMemberRepo].
  DeleteMemberRepoProvider(
    String memberNumber,
  ) : this._internal(
          (ref) => deleteMemberRepo(
            ref as DeleteMemberRepoRef,
            memberNumber,
          ),
          from: deleteMemberRepoProvider,
          name: r'deleteMemberRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteMemberRepoHash,
          dependencies: DeleteMemberRepoFamily._dependencies,
          allTransitiveDependencies:
              DeleteMemberRepoFamily._allTransitiveDependencies,
          memberNumber: memberNumber,
        );

  DeleteMemberRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.memberNumber,
  }) : super.internal();

  final String memberNumber;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteMemberRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteMemberRepoProvider._internal(
        (ref) => create(ref as DeleteMemberRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        memberNumber: memberNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteMemberRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteMemberRepoProvider &&
        other.memberNumber == memberNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, memberNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteMemberRepoRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `memberNumber` of this provider.
  String get memberNumber;
}

class _DeleteMemberRepoProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteMemberRepoRef {
  _DeleteMemberRepoProviderElement(super.provider);

  @override
  String get memberNumber => (origin as DeleteMemberRepoProvider).memberNumber;
}

String _$getAllMembersRepoHash() => r'8c60677a23997227f05383a008c8f163c2fd150b';

/// See also [getAllMembersRepo].
@ProviderFor(getAllMembersRepo)
final getAllMembersRepoProvider =
    AutoDisposeFutureProvider<List<Member>>.internal(
  getAllMembersRepo,
  name: r'getAllMembersRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllMembersRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllMembersRepoRef = AutoDisposeFutureProviderRef<List<Member>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
