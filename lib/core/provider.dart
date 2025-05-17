import 'package:flutter_application_1/core/data/model/astrologer.dart';
import 'package:flutter_application_1/core/data/repo/astrologer_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repository provider
final astrologerRepositoryProvider = Provider<AstrologerRepository>((ref) {
  return AstrologerRepository();
});

// Provider for all astrologers
final astrologersProvider = Provider<List<Astrologer>>((ref) {
  final repository = ref.watch(astrologerRepositoryProvider);
  return repository.getAstrologers();
});

// Provider for a specific astrologer by ID
final astrologerByIdProvider = Provider.family<Astrologer?, String>((ref, id) {
  final repository = ref.watch(astrologerRepositoryProvider);
  return repository.getAstrologerById(id);
});

// Provider for the selected astrologer ID
final selectedAstrologerIdProvider = StateProvider<String?>((ref) => null);

// Provider that returns the selected astrologer object
final selectedAstrologerProvider = Provider<Astrologer?>((ref) {
  final selectedId = ref.watch(selectedAstrologerIdProvider);
  if (selectedId == null) return null;

  return ref.watch(astrologerByIdProvider(selectedId));
});
